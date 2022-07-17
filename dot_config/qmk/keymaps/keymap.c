#include QMK_KEYBOARD_H

// enum combos { 
//   HT_ENT,
//   TN_BSPC,
//   HTN_DEL,
//   EU_TAB,
//   OE_ESC,
//   
// };

// const uint16_t PROGMEM ht_ent[] = { KC_H, KC_T, COMBO_END};
// const uint16_t PROGMEM tn_bspc[] = { KC_T, RGUI_T(KC_N), COMBO_END};
// const uint16_t PROGMEM htn_del[] = { KC_H, KC_T, RGUI_T(KC_N), COMBO_END};
// const uint16_t PROGMEM eu_tab[] = { KC_E, KC_U, COMBO_END};
// const uint16_t PROGMEM oe_esc[] = { LGUI_T(KC_O), KC_E, COMBO_END};
//
// combo_t key_combos[COMBO_COUNT] = {
//   [HT_ENT] = COMBO(ht_ent, KC_ENT),
//   [TN_BSPC] = COMBO(tn_bspc, KC_BSPC),
//   [HTN_DEL] = COMBO(htn_del, KC_DEL),
//   [EU_TAB] = COMBO(eu_tab, KC_TAB),
//   [OE_ESC] = COMBO(oe_esc, KC_ESC),
//   
// };

/* THIS FILE WAS GENERATED!
 *
 * This file was generated by qmk json2c. You may or may not want to
 * edit it directly.
 */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_split_3x5_2(KC_QUOT, KC_COMM, KC_DOT, KC_P, KC_Y, KC_F, KC_G, KC_C, KC_R, KC_L, KC_A, KC_O, KC_E, KC_U, KC_I, KC_D, KC_H, KC_T, KC_N, KC_S, KC_SCLN, KC_Q, KC_J, KC_K, KC_X, KC_B, KC_M, KC_W, KC_V, KC_Z, OSL(3), OSL(1), OSL(2), KC_SPC),
	[1] = LAYOUT_split_3x5_2(KC_GRV, KC_EXLM, KC_QUES, KC_PIPE, KC_AMPR, KC_BSLS, KC_PSLS, KC_PERC, KC_LBRC, KC_RBRC, OSM(MOD_LALT), OSM(MOD_LGUI), OSM(MOD_LSFT), OSM(MOD_LCTL), KC_TILD, KC_AT, KC_HASH, KC_ASTR, KC_LPRN, KC_RPRN, KC_UNDS, KC_PMNS, KC_PEQL, KC_PLUS, KC_NO, KC_NO, KC_CIRC, KC_DLR, KC_LCBR, KC_RCBR, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),
	[2] = LAYOUT_split_3x5_2(KC_HOME, KC_END, KC_PGDN, KC_PGUP, KC_CAPS, KC_BRIU, KC_WH_U, KC_WH_D, KC_WH_L, KC_WH_R, KC_ESC, KC_BSPC, KC_ENT, KC_TAB, KC_DEL, KC_BRID, OSM(MOD_RCTL), OSM(MOD_RSFT), OSM(MOD_RGUI), OSM(MOD_RALT), KC_LEFT, KC_RGHT, KC_DOWN, KC_UP, KC_INS, KC_MPLY, KC_VOLU, KC_VOLD, KC_MPRV, KC_MNXT, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),
	[3] = LAYOUT_split_3x5_2(KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_PMNS, KC_7, KC_8, KC_9, KC_PSLS, OSM(MOD_RALT), OSM(MOD_RGUI), OSM(MOD_RSFT), OSM(MOD_RCTL), KC_NO, KC_PPLS, KC_1, KC_2, KC_3, KC_0, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_PEQL, KC_4, KC_5, KC_6, KC_PAST, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS)
};
 
// layer_state_t layer_state_set_user(layer_state_t state) {
//   return update_tri_layer_state(state, 1, 2, 3);
// }
