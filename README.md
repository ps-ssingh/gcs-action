GCP File Operations Action
This GitHub Action facilitates file operations between local and Google Cloud Storage (GCS) locations using gsutil commands. It supports operations such as copy (cp) and synchronize (rsync), allowing for flexible file management within GCP or between GCP and the local file system.

Inputs
source_file
Description: The file path to be sourced from. Can be a local file or a GCP storage file (gs://).
Required: Yes
destination_file
Description: The file path to be uploaded to. Can be a local file or a GCP storage file.
Required: Yes
application_credentials
Description: Base64-encoded IAM credentials for accessing the GCP bucket.
Required: Yes
project_id
Description: The project ID that the bucket lives under.
Required: Yes
flags
Description: Additional flags to be passed to the gsutil command.
Required: No
Default: "" (empty string)
command
Description: The gsutil command to execute (e.g., cp, rsync).
Required: Yes
sync_dir_from
Description: Directory to sync from. Required if command is rsync.
Required: No
sync_dir_to
Description: Directory to sync to. Required if command is rsync.
Required: No
exclude
Description: Pattern to exclude files from sync. Used with rsync command.
Required: No
Default: "" (empty string)
Example Usage
Below is an example of how to use this action in your workflow:

```yaml
jobs:
  file_operations:
    runs-on: ubuntu-latest
    name: Perform GCP File Operations
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: GCP File Operation
      uses: your-github-username/your-action-repo@main
      with:
        source_file: 'path/to/source/file'
        destination_file: 'gs://your-bucket/path/to/destination'
        application_credentials: ${{ secrets.GCP_SA_KEY }}
        project_id: 'your-gcp-project-id'
        command: 'cp' # or 'rsync'
        # Additional inputs as needed
Notes
Ensure that the application_credentials input is correctly base64-encoded to avoid errors during decoding.
When specifying GCP storage paths, use the gs:// prefix.
This action uses the Docker image google/cloud-sdk to execute gsutil commands, providing a consistent environment for GCP interactions.
Troubleshooting
If you encounter permission errors, ensure that the IAM credentials provided have the necessary permissions for the operations you're attempting.
For rsync operations, ensure both sync_dir_from and sync_dir_to are correctly specified according to your needs.
For more detailed information on gsutil and its commands, refer to the Google Cloud gsutil documentation.
