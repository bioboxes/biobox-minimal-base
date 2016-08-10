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
