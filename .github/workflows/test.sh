files=".github/workflows/dd-agent-container.yml dd_agent/conf.d/apache.d/conf.yaml dd_agent/conf.d/disk.d/conf.yaml dd_agent/conf.d/sugar.d/conf.yaml"
changed=FALSE
for file in $files
do
    if grep -q "dd_agent/" <<< "$file"; then
        changed=TRUE
        break
    fi
done
echo $changed