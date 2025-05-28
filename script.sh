git fetch --tags # Fetches all tags present in the remmote repo

latest_tag=$(git tag | grep -E '^v[0-9]+\.[0-9]+$' | sort -V | tail -n 1)   # get the latest tag among the tags fetched

if [ -z "$latest_tag" ]; then   # if no tag exist - creates a new tag 
    new_tag="v1.0"
else
    major=$(echo "$latest_tag" | cut -d'.' -f1 | sed 's/v//')
    minor=$(echo "$latest_tag" | cut -d'.' -f2)

    if [ "$Change_Type" = "Minor" ]; then    # if the chosen paramter is a Minor change - then it changes only the digit AFTER the decimal -- i.e.  v2.0 ---> v2.1, v3.2 ---> v3.3
        next_minor=$((minor + 1))
        new_tag="v${major}.${next_minor}"

    elif [ "$Change_Type" = "Major" ]; then  # if the chosen paramter is a Major change - then it changes only the digit BEFORE the decimal -- i.e.  v2.4 ---> v3.0, v3.0 ---> v4.0
        next_major=$((major + 1))
        new_tag="v${next_major}.0"

    else
        echo "Error: Invalid Change_Type. Must be 'Minor' or 'Major'."
        exit 1
    fi
fi

echo "Creating new tag: $new_tag"            # Displays the NEW_TAG being created...
git tag "$new_tag"                           # Pushes that tag to the remote repo

export GIT_TAG_NAME="$new_tag"               # exporting the new tag created to the environment variable $GIT_TAG_NAME
echo "GIT_TAG_NAME=$GIT_TAG_NAME"
