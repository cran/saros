remove_empty_col_for_mesos_group <- function(data,
                                             chapter_overview,
                                             mesos_group = NULL,
                                             mesos_var,
                                             log_file = NULL,
                                             hide_result_if_n_below = 10) {
  if(is_string(mesos_group)) {
    unique_vars <- unique(c(as.character(chapter_overview$.variable_name_dep),
                            as.character(chapter_overview$.variable_name_indep)))
    unique_vars <- unique_vars[!is.na(unique_vars)]
    for(var in unique_vars) {
      tmp <- vctrs::vec_slice(data,
                              !is.na(data[[mesos_var]]) &
                                data[[mesos_var]] == mesos_group)

      if(all(is.na(tmp[[var]])) ||
         (length(tmp[[var]]) < hide_result_if_n_below) &&
         !is.character(tmp[[var]])) {
        msg <- "In mesos_group {mesos_group}, removing empty column {var}."
        cli::cli_inform(msg)
        if(is_string(log_file)) {
          cli::cat_print(x = paste0(msg, "\n"), file = log_file)
        }
        chapter_overview <- vctrs::vec_slice(chapter_overview,
                                             as.character(chapter_overview[[".variable_name_dep"]]) != var)
      }
    }
  }
  chapter_overview

}
