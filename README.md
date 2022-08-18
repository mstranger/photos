# README

Sync two folders with `*.jpg` and `*.raw` files.

For example there are exist `folder/jpg/{1,3}.jpg` and `folder/raw/{1,2,3}.raw`. After exec 
```sh
./run.rb folder/jpg folder/raw
``` 
both folders will be contain only `1` and `3` files, but with different extensions.

## Options

`-h, --help` displays help information<br>
`-v, --verbose` displays information about deleted files

