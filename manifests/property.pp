# == Type: mfi::property
#
define mfi::property (
  $value    = '',
  $target
) {
  augeas { "${target}/${prop}/${value}":
    lens    => 'Properties.lns',
    incl    => $target,
    changes => "set ${title} ${value}",
  }
}
