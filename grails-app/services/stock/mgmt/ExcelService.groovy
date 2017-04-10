package stock.mgmt

import grails.transaction.Transactional
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.apache.poi.xssf.streaming.SXSSFWorkbook
import org.springframework.context.MessageSource

/**
 * Service dealing with export/import tasks.
 */
@Transactional
class ExcelService {

    MessageSource messageSource

    /**
     * Loads data from XLS file to database.
     *
     * @param stream InputStream for the uploaded file
     */
    def load(InputStream stream) {
        WorkbookFactory.create(stream).withCloseable { wb ->
            Sheet sheet = wb.getSheetAt(0)
            sheet.each { row ->
                def externalId = row.getCell(0).stringCellValue
                Article article = Article.findWhere(externalId: externalId) ?: new Article(externalId: externalId)
                article.amount += row.getCell(2).numericCellValue
                article.name = row.getCell(1).stringCellValue
                article.save()
            }
        }
    }

    /**
     * Exports data from the list to an excel sheet.
     *
     * @param articles list of articles
     * @param locale — for filling the i18n-ed header values
     * @param stream output stream to write the result to
     */
    def export(List<Article> articles, Locale locale, OutputStream stream) {
        new SXSSFWorkbook().withCloseable { wb ->
            Sheet sheet = wb.createSheet()

            // table header
            Row row = sheet.createRow(0)
            [
                    'article.table.column.externalId',
                    'article.table.column.name',
                    'article.table.column.brand',
                    'article.table.column.price',
                    'article.table.column.volume',
                    'article.table.column.amount'
            ].eachWithIndex { String code, int i ->
                row.createCell(i).setCellValue(messageSource.getMessage(code, null, locale))
            }

            // table contents
            articles.indexed().each { idx, article ->
                row = sheet.createRow(idx + 1)
                [
                        article.externalId,
                        article.name,
                        article.brand,
                        article.price,
                        article.volume,
                        article.amount,
                ].eachWithIndex { value, i -> row.createCell(i).setCellValue(value) }
            }
            wb.write(stream)
        }
    }

}
