testthat::test_that("make_filenames_list", {
  saros:::make_filenames_list(element_folderpath_relative = "testfolder",
                              element_folderpath_absolute = "c:/testfolder",
                              filename_prefix = "figure_1",
                              tabular_format = "delim",
                              serialized_format = "rds") |>
  testthat::expect_equal(
    list(rel = list(rds = "testfolder/figure_1.rds",
                    png = "testfolder/figure_1.png",
                    delim = "testfolder/figure_1.delim",
                    txt = "testfolder/figure_1.txt",
                    docx = "testfolder/figure_1.docx"),
         abs = list(rds = "c:/testfolder/figure_1.rds",
                    png = "c:/testfolder/figure_1.png",
                    delim = "c:/testfolder/figure_1.delim",
                    txt = "c:/testfolder/figure_1.txt",
                    docx = "c:/testfolder/figure_1.docx")))
  saros:::make_filenames_list(element_folderpath_relative = NA,
                              element_folderpath_absolute = NA,
                              filename_prefix = NA,
                              tabular_format = "csv",
                              serialized_format = "rds") |>
    testthat::expect_equal(
      list(rel = list(rds = "NA/NA", png = "NA/NA", csv = "NA/NA",
                      txt = "NA/NA", docx = "NA/NA"),
           abs = list(rds = "NA/NA", png = "NA/NA", csv = "NA/NA",
                      txt = "NA/NA", docx = "NA/NA"))
           )

  saros:::make_filenames_list(element_folderpath_relative = "testfolder",
                              element_folderpath_absolute = "c:/testfolder",
                              filename_prefix = "figure_1",
                              serialized_format = "qs",
                              tabular_format = "delim") |>
    testthat::expect_equal(
      list(rel = list(qs = "testfolder/figure_1.qs",
                      png = "testfolder/figure_1.png",
                      delim = "testfolder/figure_1.delim",
                      txt = "testfolder/figure_1.txt",
                      docx = "testfolder/figure_1.docx"),
           abs = list(qs = "c:/testfolder/figure_1.qs",
                      png = "c:/testfolder/figure_1.png",
                      delim = "c:/testfolder/figure_1.delim",
                      txt = "c:/testfolder/figure_1.txt",
                      docx = "c:/testfolder/figure_1.docx")))
  saros:::make_filenames_list(element_folderpath_relative = NA,
                              element_folderpath_absolute = NA,
                              filename_prefix = NA,
                              serialized_format = "qs",
                              tabular_format = "delim") |>
    testthat::expect_equal(
      list(rel = list(qs = "NA/NA", png = "NA/NA", delim = "NA/NA",
                      txt = "NA/NA", docx = "NA/NA"),
           abs = list(qs = "NA/NA", png = "NA/NA", delim = "NA/NA",
                      txt = "NA/NA", docx = "NA/NA"))
    )
})
