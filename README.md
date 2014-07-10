java-buildpack cookbook
=========================

This [cookbook](https://github.com/malston/java-buildpack-vm) installs Sun Java 7, RubyEnv, RubyGem, and installs the Java Buildpack forked from malston repository. This fork contains all the ruby gems required to build the offline buildpack. They are packaged into the `vendor/cache` directory.

### Install vagrant plugins

    vagrant plugin install vagrant-sshfs #<-- not using this yet
    vagrant plugin install vagrant-omnibus
    vagrant plugin uninstall vagrant-berkshelf #<-- make you don't have an older version
    vagrant plugin install vagrant-berkshelf --plugin-version=2.0.1

    gem install berkshelf
    berks init . #<— first time and has already be done and checked in to git
    berks install

## Supported Platforms

# ubuntu
# centos

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['java-buildpack-vm']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### java-buildpack-vm::default

Include `java-buildpack-vm` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[java-buildpack-vm::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Mark Alston (<marktalston@gmail.com>)
