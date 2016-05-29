# biobox minimal base image

This is contains a minimal debian base image for creating bioboxes. This
bundles software which can make the verification and argument parsing steps of
running a biobox easier. The included software are:

  * **validate-biobox-file** - used to ensure the biobox.yaml given to the
    container is correct. This should be used to make sure the the arguments
    given by user the container are correct, and provide usable error messages
    if not the case.

  * **yaml2json** and **jq** - the biobox.yaml file contains the arguments to
    run the software in the container. Using a combination of yaml2json and jq
    the input parameters can be extracted from the biobox.yaml. An example of
    fetching fastq paths from the biobox.yaml is:

    ```
    yaml2json /bbx/input/biobox.yaml |\
      jq --raw-output 'select(has("fasta")) | .fasta[].id'
    ```
