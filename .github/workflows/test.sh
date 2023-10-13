files=".github/workflows/dd-agent-container.yml dd_agent/Dockerfile"
changed=FALSE
for file in $files
do
    if [[ "$file" == "dd_agent/Dockerfile" ]]; then
        changed=TRUE
        break
    fi
done
echo "changed=$changed" >> $GITHUB_OUTPUT