# biobox minimal base image

## About

This is contains a minimal debian base image for creating bioboxes. This
bundles software which can make the verification and argument parsing steps of
running a biobox easier. The included software are:

  * **validate_inputs.sh** - used to ensure the biobox.yaml given to the
    container is correct. This is run as the `ENTRYPOINT` directive in the
    Dockerfile. After checking the biobox.yaml file the script named by the
    `BIOBOX_EXEC` environment variable in the developer's Dockfile is called.

  * **biobox_args.sh** - Fetches the `biobox.yaml` arguments and then applies a
    given [jq][] path. An example of fetching fastq paths is:

    ```
    biobox_args.sh 'select(has("fasta")) | .fasta | map(.value)'
    ```

[jq]: https://stedolan.github.io/jq/manual/

## Using

Developing bioboxes using the bioboxes minimal base image requires creating a
executable script inside the image and setting the environment variable
`BIOBOX_EXEC`. This script will be executed by the validate_inputs.sh script
after checking the biobox.yaml file is valid. The follow environment variables
will also be set and are recommended to be used:

  * **INPUT** The location of the biobox.yaml file mounted in the container.
  * **OUTPUT** The location of the output directory where generated files
    should be placed, including a new biobox.yaml describing the generated
    outputs.
  * **METADATA** A directory for storing logs and other metadata.
