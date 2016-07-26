define awsnodes::linuxnode (
  $pp_department      = "tse",
  $pp_project         = "allstate/demo/workshop",
  $pp_created_by      = "nicolas",
  $key_name           = "nico-usw-mbook",
  $image_ids          = "ami-775e4f16",
  $security_groups    = ['tse-crossconnect', 'tse-master'],
  $subnet             = 'tse-subnet-avza-1',
  $pe_master_hostname = $::ec2_metadata['local-hostname'],
  $nodename           = $title,
  $availability_zone  = $::ec2_metadata['placement']['availability-zone'],
  $region             = $::ec2_region,
  $instance_type      = 't1.micro',
) {

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_ids,
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'department'    => $pp_department,
      'project'       => $pp_project,
      'created_by'    => $pp_created_by,
    },
    user_data         => template('awsnodes/linux.erb'),
  }

}
