webtalk_init -webtalk_dir /home/bkmn/dev/RMRV_SV_pipeline/RMRV_SVer.sim/sim_1/behav/xsim/xsim.dir/PC_sim_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Wed Jan 29 06:15:47 2020" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2019.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2708876" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "fe7cdc15-8b2f-447e-8302-4f5070bddf89" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "7c3f129f61b64714adfa66a82d6293ac" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "21" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 18.04.3 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i5-6600 CPU @ 3.30GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "898.620 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "25.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "1 us" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "2" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.02_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "130112_KB" -context "xsim\\usage"
webtalk_transmit -clientid 1497159601 -regid "" -xml /home/bkmn/dev/RMRV_SV_pipeline/RMRV_SVer.sim/sim_1/behav/xsim/xsim.dir/PC_sim_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/bkmn/dev/RMRV_SV_pipeline/RMRV_SVer.sim/sim_1/behav/xsim/xsim.dir/PC_sim_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/bkmn/dev/RMRV_SV_pipeline/RMRV_SVer.sim/sim_1/behav/xsim/xsim.dir/PC_sim_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate