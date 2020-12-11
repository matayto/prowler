#!/bin/sh
AWSDIR=/scout/.aws

if [ ! -d ${AWSDIR} ]; then
    mkdir ${AWSDIR}

    # create the config template
    cat <<'EOF' >${AWSDIR}/config
    [default]
    region = us-east-1
    output = json
EOF
fi
