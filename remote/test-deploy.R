# Load The packages --------------------------------------
library(sandpaper)
library(usethis)
library(withr)
library(ids)
library(fs)
# Generate the Lesson ------------------------------------
tmp <- tempfile()
id <- paste0("TEST-", adjective_animal(style = "kebab"))
dir_create(tmp)
lsn <- path(tmp, id)
create_lesson(lsn, open = FALSE)
# Push the Lesson To Github ------------------------------
with_dir(lsn, {
  use_github()
})
# Render and Deploy the Lesson ---------------------------
with_dir(lsn, {
  sandpaper:::ci_deploy()
})
# Set GitHub Pages ---------------------------------------
with_dir(lsn, {
  use_github_pages()
})
