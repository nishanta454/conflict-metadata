create
	table
		metadata_db.tbl_meta_ref_source_system(
			src_system_sgk serial,
			name varchar(150),
			description varchar(250),
			system_type varchar(100),
			eff_start_dt date,
			eff_end_dt date,
			active_ind char(1),
			created_by varchar(20),
			created_dt timestamp,
			update_by varchar(20),
			update_dt timestamp,
			constraint pk_meta_ref_source_system primary key(src_system_sgk)
		);

create
	table
		metadata_db.tbl_meta_program_owner(
			prog_owner_sgk serial,
			prog_owner varchar(150),
			description varchar(250),
			email varchar(100),
			eff_start_dt date,
			eff_end_dt date,
			active_ind char(1),
			created_by varchar(50),
			created_dt timestamp,
			update_by varchar(20),
			update_dt timestamp,
			constraint pk_meta_program_owner_email primary key(prog_owner_sgk)
		);

create
	table
		metadata_db.tbl_meta_program_alert(
			prog_alert_sgk serial,
			src_system_sgk integer,
			src_system_id varchar(32),
			field_name varchar(150),
			value integer,
			seq_no integer,
			suppress_reason varchar(150),
			message_copy varchar(500),
			eff_start_dt date,
			eff_end_dt date,
			active_ind char(1),
			created_by varchar(50),
			created_dt timestamp,
			update_by varchar(20),
			update_dt timestamp,
			constraint pk_meta_program_alert primary key(prog_alert_sgk),
			constraint fk_meta_program_alert foreign key(src_system_sgk) references metadata_db.tbl_meta_ref_source_system(src_system_sgk)
		);

create
	table
		metadata_db.tbl_meta_prog_alert_owner_mapping(
			prog_alert_owner_mapng_sgk integer,
			prog_owner_sgk integer,
			prog_alert_sgk integer,
			eff_start_dt date,
			eff_end_dt date,
			active_ind char(1),
			created_by varchar(50),
			created_dt timestamp,
			update_by varchar(20),
			update_dt timestamp,
			constraint pk_meta_prog_alert_owner_mapping primary key(prog_alert_owner_mapng_sgk),
			constraint fk_meta_program_owner foreign key(prog_owner_sgk) references metadata_db.tbl_meta_program_owner(prog_owner_sgk),
			constraint fk_meta_program_alert foreign key(prog_alert_sgk) references metadata_db.tbl_meta_program_alert(prog_alert_sgk)
		);
		
		