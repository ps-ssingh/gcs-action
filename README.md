# GCP File Operations GitHub Action

This GitHub Action enables file operations between local and Google Cloud Storage (GCS), leveraging `gsutil` commands for operations like copying (`cp`) and synchronizing (`rsync`). It's designed for workflows that require moving or syncing files between GCP buckets or between local storage and GCP.

## Inputs

Below are the inputs required by the action, with details on their purpose and requirements.

### `source_file`
**Required**: Yes  
**Description**: The file path to be sourced from. This can be a local file path or a GCP storage file path prefixed with `gs://`.

### `destination_file`
**Required**: Yes  
**Description**: The file path where the file(s) should be uploaded. This can be a local file path or a GCP storage file path prefixed with `gs://`.

### `application_credentials`
**Required**: Yes  
**Description**: Base64-encoded IAM credentials for accessing the GCP bucket. Ensure your credentials are encoded correctly before passing them to this action.

### `project_id`
**Required**: Yes  
**Description**: The GCP project ID under which the target bucket exists.

### `flags`
**Required**: No  
**Default**: `""` (empty string)  
**Description**: Additional flags to pass to the `gsutil` command. This allows for custom configuration of the `gsutil` behavior.

### `command`
**Required**: Yes  
**Description**: Specifies the `gsutil` command to execute. Supported commands include `cp` for copying files and `rsync` for synchronizing directories.

### `sync_dir_from`
**Required**: No (Required if `command` is `rsync`)  
**Description**: The directory to synchronize from. This input is required if the `command` input is set to `rsync`.

### `sync_dir_to`
**Required**: No (Required if `command` is `rsync`)  
**Description**: The directory to synchronize to. This input is required if the `command` input is set to `rsync`.

### `exclude`
**Required**: No  
**Default**: `""` (empty string)  
**Description**: A pattern to exclude files from synchronization when using the `rsync` command.

## Example Usage

```yaml
steps:
- name: GCP File Operations
  uses: ps-ssingh/gcs-action@v1.0
  with:
    source_file: 'path/to/source'
    destination_file: 'gs://your-bucket/path/to/destination'
    application_credentials: ${{ secrets.GCP_SA_CREDENTIALS }}
    project_id: 'your-project-id'
    command: 'cp' # Or 'rsync'
    # Include other inputs as necessary
