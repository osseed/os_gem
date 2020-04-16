<?php

/**
 * @file
 * Enables modules and site configuration for a lafd site installation.
 */

use Drupal\Core\Form\FormStateInterface;

// Randonly set this before installation if needed.
define('GEM_SITE_UUID', '9709148b-d54c-493a-899f-3bf27d3822a7');

/**
 * Implements hook_form_FORM_ID_alter().
 */
function os_gem_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  $form['#submit'][] = 'os_gem_form_install_configure_submit';
}

/**
 * Submit handler for post processes.
 */
function os_gem_form_install_configure_submit($form, FormStateInterface $form_state) {
  // Set up the site uuid to make sure config import works on any instance.
  $config_factory = \Drupal::configFactory();
  $config_factory->getEditable('system.site')->set('uuid', GEM_SITE_UUID)->save();
  // Flush all persistent caches, reset all variables,
  // and rebuild all data structures.
  drupal_flush_all_caches();
}
