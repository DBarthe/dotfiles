# utils functions
_clean_folder()
{
  if [ $# -ne 1 ]; then
    return 1
  fi

  find "$1" -type f -name '*~' -exec rm {} \;
  find "$1" -type f -name '#*#' -exec rm {} \;
  find "$1" -type f -name '.#*#' -exec rm {} \;
}

clean()
{

  if [ $# -eq 0 ]; then
    _clean_folder .
  else
    for folder in "$@"; do
      _clean_folder "$folder"
    done
  fi
}
