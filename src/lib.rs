#[macro_use]
extern crate ruru;
extern crate csv;
extern crate rustc_serialize;
use rustc_serialize::json;

use ruru::{Class, Object, RString};

#[derive(RustcDecodable, RustcEncodable)]
struct Record {
    gameid: String,
    qtr: u32,
    min: Option<u32>,
    sec: Option<u32>,
    team_off: String,
    team_def: String,
    down: Option<u32>,
    togo: Option<u32>,
    ydline: Option<u32>,
    description: String,
    offscore: u32,
    defscore: u32,
    season: u32,
}

methods!(
   RString,
   itself,

   fn csv_to_json(path: RString) -> RString {
       let mut rdr = csv::Reader::from_file(path.unwrap_or(RString::new("")).to_string()).unwrap();
       let mut records: Vec<Record> = vec!();
       for record in rdr.decode() {
           let rcrd: Record = record.unwrap();
           records.push(rcrd);
       }
       RString::new(&json::encode(&records).unwrap())
   }
);

#[no_mangle]
pub extern fn initialize_my_app() {
    Class::new("RustyCSV", None).define(|itself| {
        itself.def("csv_to_json", csv_to_json);
    });
}
