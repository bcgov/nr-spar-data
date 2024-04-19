--- ORACLE SEEDLOT TABLE IN THE SCHEMA
select --SYSTIMESTAMP CURRENT_TS,
	 s.APPLICANT_CLIENT_NUMBER
	,s.APPLICANT_EMAIL_ADDRESS
	,s.APPLICANT_CLIENT_LOCN          as applicant_locn_code
	,s.APPROVED_TIMESTAMP
	,s.APPROVED_USERID
	--,NULL as area_of_use_comment 					-- NO column found in Postgres
	,s.BC_SOURCE_IND
	,s.BEC_VERSION_ID
	,s.BGC_SUBZONE_CODE
	,s.BGC_ZONE_CODE
	,s.BIOTECH_PROCESSES_IND
	,s.CLCTN_VOLUME
	,s.COANCESTRY
	,s.COLLECTION_AREA_RADIUS
	,s.COLLECTION_BGC_IND
	,s.COLLECTION_CLI_LOCN_CD         as collection_locn_code
	,s.COLLECTION_CLI_NUMBER          as collection_client_number
	,s.COLLECTION_ELEVATION
	,s.COLLECTION_ELEVATION_MAX
	,s.COLLECTION_ELEVATION_MIN
	,s.COLLECTION_END_DATE
	,s.COLLECTION_LATITUDE_CODE
	,s.COLLECTION_LAT_DEG			  as collection_latitude_deg
	,s.COLLECTION_LAT_MIN             as collection_latitude_min
	,s.COLLECTION_LAT_SEC             as collection_latitude_sec
	,s.COLLECTION_LOCN_DESC
	,s.COLLECTION_LONGITUDE_CODE
	,s.COLLECTION_LONG_DEG            as collection_longitude_deg
	,s.COLLECTION_LONG_MIN            as collection_longitude_min
	,s.COLLECTION_LONG_SEC            as collection_longitude_sec
	,s.COLLECTION_SEED_PLAN_ZONE_IND
	,s.COLLECTION_SOURCE_CODE
	,s.COLLECTION_STANDARD_MET_IND
	,s.COLLECTION_START_DATE
	,s.CONE_COLLECTION_METHOD2_CODE
	,s.CONE_COLLECTION_METHOD_CODE
	,s.CONE_SEED_DESC
	,s.CONTAMINANT_POLLEN_BV
	,s.CONTROLLED_CROSS_IND
	,s.DECLARED_TIMESTAMP
	,s.DECLARED_USERID
	,s.EFFECTIVE_POP_SIZE
	,s.ELEVATION
	,s.ELEVATION_MAX
	,s.ELEVATION_MIN
	,s.ENTRY_TIMESTAMP
	,s.ENTRY_USERID
	,s.EXTRACTION_COMMENT
	,s.EXTRACTION_END_DATE
	,s.EXTRACTION_ST_DATE
	,s.EXTRACTION_VOLUME                
	,s.EXTRCT_CLI_NUMBER                as extractory_client_number
	,s.EXTRCT_CLI_LOCN_CD               as extractory_locn_code
	,s.FEMALE_GAMETIC_MTHD_CODE         
	,s.FS721A_SIGNED_IND                
	,s.GENETIC_CLASS_CODE               
	,s.HISTORICAL_TSR_DATE              
	,s.INTERM_FACILITY_CODE             
	,s.INTERM_STRG_CLIENT_LOCN          as interm_strg_locn_code 
	,s.INTERM_STRG_CLIENT_NUMBER        
	,s.INTERM_STRG_CMT
	,s.INTERM_STRG_END_DATE
	,s.INTERM_STRG_LOCN
	--,NULL as interm_strg_locn_code 				-- NO column found in Postgres 
	,s.INTERM_STRG_ST_DATE
	,s.LATITUDE_DEG_MAX
	,s.LATITUDE_DEG_MIN
	,s.LATITUDE_DEGREES
	,s.LATITUDE_MIN_MAX
	,s.LATITUDE_MIN_MIN
	,s.LATITUDE_MINUTES
	,s.LATITUDE_SEC_MAX
	,s.LATITUDE_SEC_MIN
	,s.LATITUDE_SECONDS
	,s.LNGTERM_STRG_ST_DATE
	,s.LONGITUDE_DEG_MAX
	,s.LONGITUDE_DEG_MIN
	,s.LONGITUDE_DEGREES
	,s.LONGITUDE_MIN_MAX
	,s.LONGITUDE_MIN_MIN
	,s.LONGITUDE_MINUTES
	,s.LONGITUDE_SEC_MAX
	,s.LONGITUDE_SEC_MIN
	,s.LONGITUDE_SECONDS
	,s.MALE_GAMETIC_MTHD_CODE
	,s.NAD_DATUM_CODE
	,s.NMBR_TREES_FROM_CODE
	,s.NO_OF_CONTAINERS
	--, NULL as non_orchard_pollen_contam_pct 		-- NO column found in Postgres  
	,s.ORCHARD_COMMENT                  as area_of_use_comment
	--,s.ORCHARD_CONTAMINATION_PCT  				-- NO column found in Postgres  
	--,s.ORCHARD_ID                              	-- NO column found in Postgres  
	,s.ORG_UNIT_NO
	,s.ORIGINAL_SEED_QTY
	,s.OWNERSHIP_COMMENT
	,s.POLLEN_CONTAMINATION_IND
	,s.POLLEN_CONTAMINATION_MTHD_CODE
	,s.POLLEN_CONTAMINATION_PCT
	,s.PRICE_COMMENT
	,s.PRICE_PER_KG
	,s.PROVENANCE_ID
	,s.REGISTERED_DATE
	,s.REGISTERED_SEED_IND
	,s.REVISION_COUNT
	,s.SECONDARY_ORCHARD_ID
    ,s.SEED_PLAN_UNIT_ID
	,s.SEEDLOT_COMMENT
	,s.SEEDLOT_NUMBER
	,s.SEEDLOT_SOURCE_CODE
	,s.SEEDLOT_STATUS_CODE
	,s.SEED_COAST_AREA_CODE
	,s.SEED_PLAN_ZONE_CODE
	,s.SEED_STORE_CLIENT_LOCN           as temporary_strg_locn_code
	,s.SEED_STORE_CLIENT_NUMBER         as temporary_strg_client_number
	,s.SMP_MEAN_BV_GROWTH
	,s.SMP_PARENTS_OUTSIDE
	,s.SMP_SUCCESS_PCT
	,s.STORED_CLI_LOCN_CD
	,s.STORED_CLI_NUMBER
	,s.SUPERIOR_PRVNC_IND
	--,NULL as temporary_strg_client_number 		-- NO column found in Postgres  
	,s.TEMPORARY_STORAGE_END_DATE       as temporary_strg_end_date
	--,NULL as temporary_strg_locn_code 			-- NO column found in Postgres  
	,s.TEMPORARY_STORAGE_START_DATE     as temporary_strg_start_date
	,s.TO_BE_REGISTRD_IND
	,s.TOTAL_PARENT_TREES	
	,s.UPDATE_TIMESTAMP
	,s.UPDATE_USERID
	,s.UTM_EASTING
	,s.UTM_NORTHING
	,s.UTM_ZONE
	,s.VARIANT
	,s.VEGETATION_CODE
	,s.VOL_PER_CONTAINER
from seedlot s
