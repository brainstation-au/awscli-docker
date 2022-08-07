# Maintenance

## Build failure for too long tag list

This repository compares it's own tag with awscli tags to determine if there is a new release available. When this repo has a long list of tags, the build would fail to compare them against actual awscli version.

In such a scenario, we need to list all available tags `list-tags.sh`, delete recent tags from the `tags.txt` file and leave tags that we are happy to delete. Then delete tags with `delete-tags.sh`.
