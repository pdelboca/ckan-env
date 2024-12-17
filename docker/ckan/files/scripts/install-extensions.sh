#!/bin/bash -e
echo "Installing Extensions"

python -m venv ${APP_DIR}/venv
source ${APP_DIR}/venv/bin/activate

# PDF view https://github.com/ckan/ckanext-pdfview
pip install git+https://github.com/ckan/ckanext-pdfview.git#egg=ckanext-pdfview

echo "Installing Datapusher+extension"
pip install -e git+https://github.com/okfn/datapusher-plus.git@okfn_tmp#egg=datapusher_plus
pip install -r https://raw.githubusercontent.com/okfn/datapusher-plus/okfn_tmp/requirements.txt

echo "Installing API-tracking extension"
pip install git+https://github.com/NorwegianRefugeeCouncil/ckanext-api-tracking.git@0.4.4#egg=ckanext-api-tracking
pip install -r https://raw.githubusercontent.com/NorwegianRefugeeCouncil/ckanext-api-tracking/refs/tags/0.4.4/requirements.txt

echo "Installing Apache Superset extension"
pip install git+https://github.com/unckan/ckanext-superset.git@0.1.9#egg=ckanext-superset
pip install -r https://raw.githubusercontent.com/unckan/ckanext-superset/refs/tags/0.1.9/requirements.txt

echo "Installing Announcements extension"
pip install git+https://github.com/okfn/ckanext-announcements.git@0.1.3#egg=ckanext-announcements
pip install -r https://raw.githubusercontent.com/okfn/ckanext-announcements/0.1.3/requirements.txt

echo "Installing Push Errors extension"
pip install git+https://github.com/unckan/ckanext-push-errors.git@0.1.4#egg=ckanext-push-errors
pip install -r https://raw.githubusercontent.com/unckan/ckanext-push-errors/refs/tags/0.1.4/requirements.txt

echo "CKAN extensions installed"
