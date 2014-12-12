# == Type: mfi::property
#
define mfi::property (
  $target,
  $value    = '',
) {
  augeas { "${target}/${prop}/${value}":
    lens    => 'Properties.lns',
    incl    => $target,
    changes => "set ${title} ${value}",
  }
}
