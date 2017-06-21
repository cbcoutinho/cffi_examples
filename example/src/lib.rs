// extern crate libc;
// use libc::uint32_t;

#[no_mangle]
pub extern fn adder(a: i32, b: i32) -> i32 {
    // println!("Inside adder");
    a + b
}
