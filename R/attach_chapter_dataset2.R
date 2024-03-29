attach_chapter_dataset2 <- function(chapter_overview_chapter,
                                   data,
                                   path,
                                   chapter_foldername_clean,
                                   mesos_var,
                                   auxiliary_variables,
                                   serialized_format = "rds") {


  dep_vars <- names(unlist(eval_cols(unique(as.character(chapter_overview_chapter$.variable_selection_dep)), data=data)))
  indep_vars <- names(unlist(eval_cols(unique(as.character(chapter_overview_chapter$.variable_selection_indep)), data=data)))

  data_chapter <- data[, names(data) %in% unique(c(dep_vars,
                                                   indep_vars,
                                                   mesos_var,
                                                   auxiliary_variables)), drop = FALSE]

  filename_chapter_dataset <-
    stringi::stri_c("data_", chapter_foldername_clean, ".", serialized_format, ignore_null = TRUE)
  filepath_chapter_dataset_absolute <- file.path(path, chapter_foldername_clean, filename_chapter_dataset)
  filepath_chapter_dataset_relative <- file.path(chapter_foldername_clean, filename_chapter_dataset)


  serialize_write(data_chapter, path = filepath_chapter_dataset_absolute, format = serialized_format)

  r_chunk_header <- stringi::stri_c("```{r}\n",
                                    "#| label: 'Import data for ",
                                    chapter_foldername_clean,
                                    "'",
                                    sep="", ignore_null = TRUE)
  import_code <- stringi::stri_c("data_",
                                 chapter_foldername_clean,
                                 " <- ",
                                 serialize_read_syntax(serialized_format),
                                 "('", filepath_chapter_dataset_relative, "')",
                                 sep="", ignore_null = TRUE)
  stringi::stri_c(r_chunk_header, import_code, "```", sep="\n")
}
