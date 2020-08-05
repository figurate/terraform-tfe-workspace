## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| tfe | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_apply | Indicates whether to automatically apply successful changes | `bool` | `false` | no |
| name | Name of the workspace | `any` | n/a | yes |
| oauth\_token | An OAuth token used to connect to a VCS provider | `any` | `null` | no |
| operations | Enable remote operations (disable for local runs) | `bool` | `true` | no |
| organization | Organization of the workspace | `any` | n/a | yes |
| repository | A repository identifier to link to the workspace | `any` | `null` | no |
| run\_triggers | A list of workspace ids that trigger runs in this workspace when modified | `list(string)` | `[]` | no |
| service\_provider | VCS provider identifier | `any` | `null` | no |
| workspace\_env | A map of workspace environment variables | `map(string)` | `{}` | no |
| workspace\_env\_sensitive | A map of sensitive workspace environment variables | `map(string)` | `{}` | no |
| workspace\_vars | A map of workspace variables | `map(string)` | `{}` | no |
| workspace\_vars\_sensitive | A map of sensitive workspace variables | `map(string)` | `{}` | no |

## Outputs

No output.

