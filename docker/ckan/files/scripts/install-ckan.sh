#!/bin/bash -e
echo "Installing CKAN  :: $(python --version)"

python -m venv ${APP_DIR}/venv
source ${APP_DIR}/venv/bin/activate
pip install gunicorn

echo "Creating CKAN storage directory:"
mkdir -p ${APP_DIR}/storage

# Create a source folder
cd ${APP_DIR}
git clone -b "ckan-2.10.5" "https://github.com/ckan/ckan.git" ckan
cd ckan

echo "Installing requirements"
pip install -r requirements.txt

echo "Installing CKAN package"
pip install .

echo "Patch CKAN if required"
cd ${APP_DIR}

PATCH_FOLDER=$APP_DIR/files/patches
ls -l $PATCH_FOLDER

for dir in ${PATCH_FOLDER}/*; do \
    for file in $(find "$dir"/*.patch | sort -g); do \
        abspath=$(readlink -f "$file");
        echo "$0: Applying patch $abspath";
        (cd ${APP_DIR}/ckan && git apply "$abspath" --verbose);
    done ; \
done

echo "CKAN installed"
