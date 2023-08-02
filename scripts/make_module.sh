#!/bin/bash

print_usage() {
    echo -e "Usage:\n\tmake_module.sh"
    echo -e "Example:\n\t./make_module.sh\n"
}

[[ $# -ne 0 ]] && print_usage && exit 1

# Ask user to input module name and category
echo "Module name: " && read MODULE_NAME
echo "Module category (i.e. learning, blog): " && read MODULE_CATEGORY

# Make sure category exists
[[ ! -d modules/$MODULE_CATEGORY ]] && echo "Module category $MODULE_CATEGORY does not exist. Choose one of [$(ls modules | xargs)]" && exit 1

# Create module directory and default .adoc
MODULE_DIR_NAME=$(echo $MODULE_NAME | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
mkdir -p modules/$MODULE_CATEGORY/pages/$MODULE_DIR_NAME
echo -e "= $MODULE_NAME\n\nDefault template page for module to be replaced." > modules/$MODULE_CATEGORY/pages/$MODULE_DIR_NAME/$MODULE_DIR_NAME.adoc
echo -e "\nCreated structure in modules/$MODULE_CATEGORY/pages/$MODULE_DIR_NAME:"
tree modules/$MODULE_CATEGORY/pages/$MODULE_DIR_NAME

# Create nav entry
cat >> modules/$MODULE_CATEGORY/partials/nav.adoc << EOF

* $MODULE_NAME
** xref:docs-site:$MODULE_CATEGORY:$MODULE_DIR_NAME/$MODULE_DIR_NAME.adoc[$MODULE_NAME]
EOF

echo -e "\nCreated new entry in modules/$MODULE_CATEGORY/partials/nav.adoc\n$(tail -3 modules/$MODULE_CATEGORY/partials/nav.adoc)"
