# sdinc-shinken

TODO: Enter the cookbook description here.

## Supported Platforms

### Tested And Validated On
- Ubuntu 14.04
- OSX 10.9.x
TODO maybe support windows
- Windows Server 2012 R2

## Usage

TODO: Include usage patterns of any providers or recipes.

### sdinc-shinken::default

Include `sdinc-shinken` in your run_list.

```json
{
  "run_list": [
    "recipe[sdinc-shinken::default]"
  ]
}
```

## Testing
rake with no parameters does a berks vendor

- rake ci:unit
  - rubocop
  - knife foodcritic
  - rspec
- rake ci:integration
  - kitchen test

