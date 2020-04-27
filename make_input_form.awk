function g_to_mps2(g) {
	return g * 9.80665;
}

BEGIN { FS = ","; OFS = "," };

NR > 1 {
	# Mg to meter per second squared
	$3 = g_to_mps2($3 / 1000);
	$4 = g_to_mps2($4 / 1000);
	$5 = g_to_mps2($5 / 1000);

	# Mdegs per sec to deg per sec
	$6 /= 1000;
	$7 /= 1000;
	$8 /= 1000;

	# MGauss to gauss
	$9 /= 1000;
	$10 /= 1000;
	$11 /= 1000;

	# Print dt and acc, gyro and mag data
	print $2, $3, $4, $5, $6, $7, $8, $9, $10, $11;
};
