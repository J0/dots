set -e
today="$(date +'%d_%m_%Y')"
current="$HOME/emacs_launchd_job"
website_dir="$HOME/Desktop/projects/j0.github.io"
file_to_export="inbox"

cd ~/Dropbox/org
emacsclient -e "(progn (find-file \"${file_to_export}.org\") (org-html-export-to-html) (kill-buffer))"

# Copy to logs
cp "${HOME}/Dropbox/org/${file_to_export}.html" "${current}/${file_to_export}.html"
cp "${HOME}/Dropbox/org/${file_to_export}.html" "${website_dir}/updates/${file_to_export}.html"

mv "${current}/${file_to_export}.html" "${current}/logs/${today}_${file_to_export}.html"
mv "${website_dir}/updates/${file_to_export}.html" "${website_dir}/updates/${today}_${file_to_export}.html"

echo "Succeeded in exporting script for $(date)"
cd $website_dir && git add "${website_dir}/updates/${today}_${file_to_export}.html" && git commit -m "Add notes for $(date)" && git push origin master
echo "Successfully pushed to git for $(date)"
