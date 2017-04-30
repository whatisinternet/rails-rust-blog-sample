#[macro_use]
extern crate ruru;

use ruru::{Boolean, Class, Object, RString};

methods!(
   RString,
   itself,

   fn string_is_blank() -> Boolean {
       Boolean::new(itself.to_string().chars().all(|c| c.is_whitespace()))
   }
);

#[no_mangle]
pub extern fn initialize_my_app() {
    Class::from_existing("String").define(|itself| {
        itself.def("thing?", string_is_blank);
    });
}
