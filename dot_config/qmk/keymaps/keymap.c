#include QMK_KEYBOARD_H

enum combos { 
  L1C,
  L1S,
  L1G,
  L1A,
  L2C,
  L2S,
  L2G,
  L2A,
  L1CS,
  L1GS,
  L2CS,
  L2GS,
};

const uint16_t PROGMEM l1c[] = { OSL(1), KC_U, COMBO_END};
const uint16_t PROGMEM l1s[] = { OSL(1), KC_E, COMBO_END};
const uint16_t PROGMEM l1g[] = { OSL(1), KC_O, COMBO_END};
const uint16_t PROGMEM l1a[] = { OSL(1), KC_A, COMBO_END};
const uint16_t PROGMEM l2c[] = { OSL(2), KC_H, COMBO_END};
const uint16_t PROGMEM l2s[] = { OSL(2), KC_T, COMBO_END};
const uint16_t PROGMEM l2g[] = { OSL(2), KC_N, COMBO_END};
const uint16_t PROGMEM l2a[] = { OSL(2), KC_S, COMBO_END};
const uint16_t PROGMEM l1cs[] = { KC_E, KC_U, COMBO_END};
const uint16_t PROGMEM l1gs[] = { KC_E, KC_O, COMBO_END};
const uint16_t PROGMEM l2cs[] = { KC_T, KC_H, COMBO_END};
const uint16_t PROGMEM l2gs[] = { KC_T, KC_N, COMBO_END};

combo_t key_combos[COMBO_COUNT] = {
  [L1C] = COMBO(l1c, OSM(MOD_LCTL)),
  [L1S] = COMBO(l1s, OSM(MOD_LSFT)),
  [L1G] = COMBO(l1g, OSM(MOD_LGUI)),
  [L1A] = COMBO(l1a, OSM(MOD_LALT)),
  [L2C] = COMBO(l2c, OSM(MOD_RCTL)),
  [L2S] = COMBO(l2s, OSM(MOD_RSFT)),
  [L2G] = COMBO(l2g, OSM(MOD_RGUI)),
  [L2A] = COMBO(l2a, OSM(MOD_RALT)),
  [L1CS] = COMBO(l1cs, LCTL(KC_LSFT)),
  [L1GS] = COMBO(l1gs, LGUI(KC_LSFT)),
  [L2CS] = COMBO(l2cs, RCTL(KC_RSFT)),
  [L2GS] = COMBO(l2gs, RGUI(KC_RSFT)),
};

/* THIS FILE WAS GENERATED!
 *
 * This file was generated by qmk json2c. You may or may not want to
 * edit it directly.
 */

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT_split_3x5_2(KC_QUOT, KC_COMM, KC_DOT, KC_P, KC_Y, KC_F, KC_G, KC_C, KC_R, KC_L, KC_A, KC_O, KC_E, KC_U, KC_I, KC_D, KC_H, KC_T, KC_N, KC_S, KC_SCLN, KC_Q, KC_J, KC_K, KC_X, KC_B, KC_M, KC_W, KC_V, KC_Z, OSL(3), OSL(1), OSL(2), KC_SPC),
	[1] = LAYOUT_split_3x5_2(KC_AMPR, KC_EXLM, KC_EQL, KC_QUES, KC_GRV, KC_BSLS, KC_SLSH, KC_PERC, KC_LBRC, KC_RBRC, OSM(MOD_LALT), OSM(MOD_LGUI), OSM(MOD_LSFT), OSM(MOD_LCTL), KC_TILD, KC_AT, KC_HASH, KC_ASTR, KC_LPRN, KC_RPRN, KC_PIPE, KC_UNDS, KC_MINS, KC_PLUS, KC_NO, KC_NO, KC_CIRC, KC_DLR, KC_LCBR, KC_RCBR, KC_TRNS, OSL(3), KC_TRNS, KC_TRNS),
	[2] = LAYOUT_split_3x5_2(KC_HOME, KC_END, KC_PGDN, KC_PGUP, KC_CAPS, KC_NO, KC_WH_U, KC_WH_D, KC_WH_L, KC_WH_R, KC_ESC, KC_BSPC, KC_ENT, KC_TAB, KC_DEL, KC_NO, OSM(MOD_RCTL), OSM(MOD_RSFT), OSM(MOD_RGUI), OSM(MOD_RALT), KC_LEFT, KC_RGHT, KC_DOWN, KC_UP, KC_INS, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS),
	[3] = LAYOUT_split_3x5_2(KC_NO, KC_NO, KC_NO, KC_NO, QK_BOOT, KC_PEQL, KC_PMNS, KC_PPLS, KC_0, KC_9, OSM(MOD_LALT), OSM(MOD_LGUI), OSM(MOD_LSFT), OSM(MOD_LCTL), KC_NO, KC_PAST, KC_1, KC_2, KC_3, KC_4, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_PSLS, KC_5, KC_6, KC_7, KC_8, KC_TRNS, KC_TRNS, KC_TRNS, KC_TRNS)
};
 
// layer_state_t layer_state_set_user(layer_state_t state) {
//   return update_tri_layer_state(state, 1, 2, 3);
// }
