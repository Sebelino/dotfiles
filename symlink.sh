source_path=$(readlink -f "$1")

this_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

destination_path="$this_directory/$( basename "$source_path" )"

set -x

cp "$source_path" "$this_directory" \
&& rm "$source_path" \
&& ln -s "$destination_path" "$source_path"

