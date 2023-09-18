#* Convert lbs to kg
#* @param lbs:[dbl] Value to be converted
#* @get /lbs2kg
function(lbs){
  lbs <- as.numeric(lbs)
  clinPK::lbs2kg(lbs)
}

#* Calculate Acute Kidney Injury (AKI) stage
#* @post /aki
function(req, res) {
  do.call(clinPK::calc_aki_stage, req$body)$stage
}
