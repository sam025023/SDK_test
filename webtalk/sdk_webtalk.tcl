webtalk_init -webtalk_dir C:\\DevGIT\\SDK_test\\webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Thu Jun 18 13:36:41 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2014.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2014.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "210723735_1777491030_0_350" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "fv3coucqm8n3jj7rq8s65q1ahv" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2014.4_7" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "7" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 7 , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 7600)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2200 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "17.000 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1434659604996" -context "sdk\\\\bsp/1434659604996"
webtalk_add_data -client sdk -key hwid -value "1427242902632" -context "sdk\\\\bsp/1434659604996"
webtalk_add_data -client sdk -key os -value "freertos_zynq" -context "sdk\\\\bsp/1434659604996"
webtalk_add_data -client sdk -key apptemplate -value "null" -context "sdk\\\\bsp/1434659604996"
webtalk_add_data -client sdk -key uid -value "1434659761596" -context "sdk\\\\application/1434659761596"
webtalk_add_data -client sdk -key hwid -value "1427242902632" -context "sdk\\\\application/1434659761596"
webtalk_add_data -client sdk -key bspid -value "1434659604996" -context "sdk\\\\application/1434659761596"
webtalk_add_data -client sdk -key newbsp -value "false" -context "sdk\\\\application/1434659761596"
webtalk_add_data -client sdk -key os -value "freertos_zynq" -context "sdk\\\\application/1434659761596"
webtalk_add_data -client sdk -key apptemplate -value "freertos_hello_world" -context "sdk\\\\application/1434659761596"
webtalk_transmit -clientid 3698740707 -regid "210723735_1777491030_0_350" -xml C:\\DevGIT\\SDK_test\\webtalk\\usage_statistics_ext_sdk.xml -html C:\\DevGIT\\SDK_test\\webtalk\\usage_statistics_ext_sdk.html -wdm C:\\DevGIT\\SDK_test\\webtalk\\sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
