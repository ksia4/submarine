pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is

   E072 : Short_Integer; pragma Import (Ada, E072, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E025 : Short_Integer; pragma Import (Ada, E025, "system__exception_table_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada__io_exceptions_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__strings_E");
   E040 : Short_Integer; pragma Import (Ada, E040, "ada__containers_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exceptions_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__strings__maps_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__strings__maps__constants_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__soft_links__initialize_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "system__object_reader_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "system__dwarf_lines_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__numerics_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__tags_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ada__streams_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "interfaces__c__strings_E");
   E151 : Short_Integer; pragma Import (Ada, E151, "system__file_control_block_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "system__finalization_root_E");
   E148 : Short_Integer; pragma Import (Ada, E148, "ada__finalization_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__file_io_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "system__storage_pools_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "system__finalization_masters_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__storage_pools__subpools_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__task_info_E");
   E367 : Short_Integer; pragma Import (Ada, E367, "ada__calendar_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__real_time_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ada__text_io_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__pool_global_E");
   E365 : Short_Integer; pragma Import (Ada, E365, "system__random_seed_E");
   E381 : Short_Integer; pragma Import (Ada, E381, "system__tasking__initialization_E");
   E371 : Short_Integer; pragma Import (Ada, E371, "system__tasking__protected_objects_E");
   E387 : Short_Integer; pragma Import (Ada, E387, "system__tasking__protected_objects__entries_E");
   E385 : Short_Integer; pragma Import (Ada, E385, "system__tasking__queuing_E");
   E377 : Short_Integer; pragma Import (Ada, E377, "system__tasking__stages_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "glib_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "gtkada__types_E");
   E240 : Short_Integer; pragma Import (Ada, E240, "gdk__frame_timings_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "glib__glist_E");
   E224 : Short_Integer; pragma Import (Ada, E224, "gdk__visual_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "glib__gslist_E");
   E188 : Short_Integer; pragma Import (Ada, E188, "gtkada__c_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "glib__object_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "glib__values_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "glib__types_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "glib__type_conversion_hooks_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "gtkada__bindings_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "cairo_E");
   E210 : Short_Integer; pragma Import (Ada, E210, "cairo__region_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "gdk__rectangle_E");
   E176 : Short_Integer; pragma Import (Ada, E176, "glib__generic_properties_E");
   E234 : Short_Integer; pragma Import (Ada, E234, "gdk__color_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "gdk__rgba_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "gdk__event_E");
   E343 : Short_Integer; pragma Import (Ada, E343, "glib__key_file_E");
   E402 : Short_Integer; pragma Import (Ada, E402, "glib__main_E");
   E226 : Short_Integer; pragma Import (Ada, E226, "glib__properties_E");
   E305 : Short_Integer; pragma Import (Ada, E305, "glib__string_E");
   E303 : Short_Integer; pragma Import (Ada, E303, "glib__variant_E");
   E301 : Short_Integer; pragma Import (Ada, E301, "glib__g_icon_E");
   E248 : Short_Integer; pragma Import (Ada, E248, "gtk__builder_E");
   E285 : Short_Integer; pragma Import (Ada, E285, "gtk__buildable_E");
   E317 : Short_Integer; pragma Import (Ada, E317, "gtk__cell_area_context_E");
   E333 : Short_Integer; pragma Import (Ada, E333, "gtk__css_section_E");
   E228 : Short_Integer; pragma Import (Ada, E228, "gtk__enums_E");
   E291 : Short_Integer; pragma Import (Ada, E291, "gtk__orientable_E");
   E345 : Short_Integer; pragma Import (Ada, E345, "gtk__paper_size_E");
   E341 : Short_Integer; pragma Import (Ada, E341, "gtk__page_setup_E");
   E353 : Short_Integer; pragma Import (Ada, E353, "gtk__print_settings_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "gtk__target_entry_E");
   E254 : Short_Integer; pragma Import (Ada, E254, "gtk__target_list_E");
   E261 : Short_Integer; pragma Import (Ada, E261, "pango__enums_E");
   E279 : Short_Integer; pragma Import (Ada, E279, "pango__attributes_E");
   E265 : Short_Integer; pragma Import (Ada, E265, "pango__font_metrics_E");
   E267 : Short_Integer; pragma Import (Ada, E267, "pango__language_E");
   E263 : Short_Integer; pragma Import (Ada, E263, "pango__font_E");
   E359 : Short_Integer; pragma Import (Ada, E359, "gtk__text_attributes_E");
   E361 : Short_Integer; pragma Import (Ada, E361, "gtk__text_tag_E");
   E271 : Short_Integer; pragma Import (Ada, E271, "pango__font_face_E");
   E269 : Short_Integer; pragma Import (Ada, E269, "pango__font_family_E");
   E273 : Short_Integer; pragma Import (Ada, E273, "pango__fontset_E");
   E275 : Short_Integer; pragma Import (Ada, E275, "pango__matrix_E");
   E259 : Short_Integer; pragma Import (Ada, E259, "pango__context_E");
   E349 : Short_Integer; pragma Import (Ada, E349, "pango__font_map_E");
   E281 : Short_Integer; pragma Import (Ada, E281, "pango__tabs_E");
   E277 : Short_Integer; pragma Import (Ada, E277, "pango__layout_E");
   E347 : Short_Integer; pragma Import (Ada, E347, "gtk__print_context_E");
   E204 : Short_Integer; pragma Import (Ada, E204, "gdk__display_E");
   E351 : Short_Integer; pragma Import (Ada, E351, "gtk__print_operation_preview_E");
   E323 : Short_Integer; pragma Import (Ada, E323, "gtk__tree_model_E");
   E311 : Short_Integer; pragma Import (Ada, E311, "gtk__entry_buffer_E");
   E309 : Short_Integer; pragma Import (Ada, E309, "gtk__editable_E");
   E307 : Short_Integer; pragma Import (Ada, E307, "gtk__cell_editable_E");
   E289 : Short_Integer; pragma Import (Ada, E289, "gtk__adjustment_E");
   E252 : Short_Integer; pragma Import (Ada, E252, "gtk__style_E");
   E246 : Short_Integer; pragma Import (Ada, E246, "gtk__accel_group_E");
   E238 : Short_Integer; pragma Import (Ada, E238, "gdk__frame_clock_E");
   E242 : Short_Integer; pragma Import (Ada, E242, "gdk__pixbuf_E");
   E329 : Short_Integer; pragma Import (Ada, E329, "gtk__icon_source_E");
   E222 : Short_Integer; pragma Import (Ada, E222, "gdk__screen_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "gdk__device_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "gdk__drag_contexts_E");
   E357 : Short_Integer; pragma Import (Ada, E357, "gtk__text_iter_E");
   E295 : Short_Integer; pragma Import (Ada, E295, "gdk__window_E");
   E250 : Short_Integer; pragma Import (Ada, E250, "gtk__selection_data_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "gtk__widget_E");
   E335 : Short_Integer; pragma Import (Ada, E335, "gtk__misc_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "gtk__style_provider_E");
   E220 : Short_Integer; pragma Import (Ada, E220, "gtk__settings_E");
   E331 : Short_Integer; pragma Import (Ada, E331, "gtk__style_context_E");
   E327 : Short_Integer; pragma Import (Ada, E327, "gtk__icon_set_E");
   E325 : Short_Integer; pragma Import (Ada, E325, "gtk__image_E");
   E321 : Short_Integer; pragma Import (Ada, E321, "gtk__cell_renderer_E");
   E287 : Short_Integer; pragma Import (Ada, E287, "gtk__container_E");
   E297 : Short_Integer; pragma Import (Ada, E297, "gtk__bin_E");
   E283 : Short_Integer; pragma Import (Ada, E283, "gtk__box_E");
   E355 : Short_Integer; pragma Import (Ada, E355, "gtk__status_bar_E");
   E337 : Short_Integer; pragma Import (Ada, E337, "gtk__notebook_E");
   E319 : Short_Integer; pragma Import (Ada, E319, "gtk__cell_layout_E");
   E315 : Short_Integer; pragma Import (Ada, E315, "gtk__cell_area_E");
   E313 : Short_Integer; pragma Import (Ada, E313, "gtk__entry_completion_E");
   E293 : Short_Integer; pragma Import (Ada, E293, "gtk__window_E");
   E218 : Short_Integer; pragma Import (Ada, E218, "gtk__dialog_E");
   E339 : Short_Integer; pragma Import (Ada, E339, "gtk__print_operation_E");
   E299 : Short_Integer; pragma Import (Ada, E299, "gtk__gentry_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "gtk__arguments_E");
   E400 : Short_Integer; pragma Import (Ada, E400, "gtk__drawing_area_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "gtk__main_E");
   E398 : Short_Integer; pragma Import (Ada, E398, "snake_generic_E");
   E396 : Short_Integer; pragma Import (Ada, E396, "game_spark_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "game_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E103 := E103 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "game__finalize_spec");
      begin
         F1;
      end;
      E400 := E400 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gtk__drawing_area__finalize_spec");
      begin
         F2;
      end;
      E204 := E204 - 1;
      E238 := E238 - 1;
      E246 := E246 - 1;
      E232 := E232 - 1;
      E252 := E252 - 1;
      E287 := E287 - 1;
      E289 := E289 - 1;
      E218 := E218 - 1;
      E293 := E293 - 1;
      E311 := E311 - 1;
      E321 := E321 - 1;
      E313 := E313 - 1;
      E315 := E315 - 1;
      E323 := E323 - 1;
      E299 := E299 - 1;
      E331 := E331 - 1;
      E337 := E337 - 1;
      E339 := E339 - 1;
      E355 := E355 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gtk__gentry__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gtk__print_operation__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "gtk__dialog__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gtk__window__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gtk__entry_completion__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "gtk__cell_area__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "gtk__notebook__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "gtk__status_bar__finalize_spec");
      begin
         F10;
      end;
      E283 := E283 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "gtk__box__finalize_spec");
      begin
         F11;
      end;
      E297 := E297 - 1;
      declare
         procedure F12;
         pragma Import (Ada, F12, "gtk__bin__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "gtk__container__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "gtk__cell_renderer__finalize_spec");
      begin
         F14;
      end;
      E325 := E325 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "gtk__image__finalize_spec");
      begin
         F15;
      end;
      E327 := E327 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "gtk__icon_set__finalize_spec");
      begin
         F16;
      end;
      declare
         procedure F17;
         pragma Import (Ada, F17, "gtk__style_context__finalize_spec");
      begin
         F17;
      end;
      E220 := E220 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "gtk__settings__finalize_spec");
      begin
         F18;
      end;
      E335 := E335 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "gtk__misc__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "gtk__widget__finalize_spec");
      begin
         F20;
      end;
      E250 := E250 - 1;
      declare
         procedure F21;
         pragma Import (Ada, F21, "gtk__selection_data__finalize_spec");
      begin
         F21;
      end;
      E202 := E202 - 1;
      E236 := E236 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "gdk__drag_contexts__finalize_spec");
      begin
         F22;
      end;
      declare
         procedure F23;
         pragma Import (Ada, F23, "gdk__device__finalize_spec");
      begin
         F23;
      end;
      E222 := E222 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "gdk__screen__finalize_spec");
      begin
         F24;
      end;
      E242 := E242 - 1;
      E329 := E329 - 1;
      declare
         procedure F25;
         pragma Import (Ada, F25, "gtk__icon_source__finalize_spec");
      begin
         F25;
      end;
      declare
         procedure F26;
         pragma Import (Ada, F26, "gdk__pixbuf__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "gdk__frame_clock__finalize_spec");
      begin
         F27;
      end;
      declare
         procedure F28;
         pragma Import (Ada, F28, "gtk__accel_group__finalize_spec");
      begin
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "gtk__style__finalize_spec");
      begin
         F29;
      end;
      declare
         procedure F30;
         pragma Import (Ada, F30, "gtk__adjustment__finalize_spec");
      begin
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "gtk__entry_buffer__finalize_spec");
      begin
         F31;
      end;
      declare
         procedure F32;
         pragma Import (Ada, F32, "gtk__tree_model__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "gdk__display__finalize_spec");
      begin
         F33;
      end;
      E347 := E347 - 1;
      declare
         procedure F34;
         pragma Import (Ada, F34, "gtk__print_context__finalize_spec");
      begin
         F34;
      end;
      E277 := E277 - 1;
      declare
         procedure F35;
         pragma Import (Ada, F35, "pango__layout__finalize_spec");
      begin
         F35;
      end;
      E281 := E281 - 1;
      declare
         procedure F36;
         pragma Import (Ada, F36, "pango__tabs__finalize_spec");
      begin
         F36;
      end;
      E349 := E349 - 1;
      declare
         procedure F37;
         pragma Import (Ada, F37, "pango__font_map__finalize_spec");
      begin
         F37;
      end;
      E259 := E259 - 1;
      declare
         procedure F38;
         pragma Import (Ada, F38, "pango__context__finalize_spec");
      begin
         F38;
      end;
      E273 := E273 - 1;
      declare
         procedure F39;
         pragma Import (Ada, F39, "pango__fontset__finalize_spec");
      begin
         F39;
      end;
      E269 := E269 - 1;
      declare
         procedure F40;
         pragma Import (Ada, F40, "pango__font_family__finalize_spec");
      begin
         F40;
      end;
      E271 := E271 - 1;
      declare
         procedure F41;
         pragma Import (Ada, F41, "pango__font_face__finalize_spec");
      begin
         F41;
      end;
      E361 := E361 - 1;
      declare
         procedure F42;
         pragma Import (Ada, F42, "gtk__text_tag__finalize_spec");
      begin
         F42;
      end;
      E263 := E263 - 1;
      declare
         procedure F43;
         pragma Import (Ada, F43, "pango__font__finalize_spec");
      begin
         F43;
      end;
      E267 := E267 - 1;
      declare
         procedure F44;
         pragma Import (Ada, F44, "pango__language__finalize_spec");
      begin
         F44;
      end;
      E265 := E265 - 1;
      declare
         procedure F45;
         pragma Import (Ada, F45, "pango__font_metrics__finalize_spec");
      begin
         F45;
      end;
      E279 := E279 - 1;
      declare
         procedure F46;
         pragma Import (Ada, F46, "pango__attributes__finalize_spec");
      begin
         F46;
      end;
      E254 := E254 - 1;
      declare
         procedure F47;
         pragma Import (Ada, F47, "gtk__target_list__finalize_spec");
      begin
         F47;
      end;
      E353 := E353 - 1;
      declare
         procedure F48;
         pragma Import (Ada, F48, "gtk__print_settings__finalize_spec");
      begin
         F48;
      end;
      E341 := E341 - 1;
      declare
         procedure F49;
         pragma Import (Ada, F49, "gtk__page_setup__finalize_spec");
      begin
         F49;
      end;
      E345 := E345 - 1;
      declare
         procedure F50;
         pragma Import (Ada, F50, "gtk__paper_size__finalize_spec");
      begin
         F50;
      end;
      E333 := E333 - 1;
      declare
         procedure F51;
         pragma Import (Ada, F51, "gtk__css_section__finalize_spec");
      begin
         F51;
      end;
      E317 := E317 - 1;
      declare
         procedure F52;
         pragma Import (Ada, F52, "gtk__cell_area_context__finalize_spec");
      begin
         F52;
      end;
      E248 := E248 - 1;
      declare
         procedure F53;
         pragma Import (Ada, F53, "gtk__builder__finalize_spec");
      begin
         F53;
      end;
      E303 := E303 - 1;
      declare
         procedure F54;
         pragma Import (Ada, F54, "glib__variant__finalize_spec");
      begin
         F54;
      end;
      E178 := E178 - 1;
      declare
         procedure F55;
         pragma Import (Ada, F55, "glib__object__finalize_spec");
      begin
         F55;
      end;
      E240 := E240 - 1;
      declare
         procedure F56;
         pragma Import (Ada, F56, "gdk__frame_timings__finalize_spec");
      begin
         F56;
      end;
      E154 := E154 - 1;
      declare
         procedure F57;
         pragma Import (Ada, F57, "glib__finalize_spec");
      begin
         F57;
      end;
      E387 := E387 - 1;
      declare
         procedure F58;
         pragma Import (Ada, F58, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F58;
      end;
      E165 := E165 - 1;
      declare
         procedure F59;
         pragma Import (Ada, F59, "system__pool_global__finalize_spec");
      begin
         F59;
      end;
      E141 := E141 - 1;
      declare
         procedure F60;
         pragma Import (Ada, F60, "ada__text_io__finalize_spec");
      begin
         F60;
      end;
      E169 := E169 - 1;
      declare
         procedure F61;
         pragma Import (Ada, F61, "system__storage_pools__subpools__finalize_spec");
      begin
         F61;
      end;
      E159 := E159 - 1;
      declare
         procedure F62;
         pragma Import (Ada, F62, "system__finalization_masters__finalize_spec");
      begin
         F62;
      end;
      declare
         procedure F63;
         pragma Import (Ada, F63, "system__file_io__finalize_body");
      begin
         E147 := E147 - 1;
         F63;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, True, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, False, True, True, False, False, 
           True, False, False, True, True, True, True, False, 
           False, False, False, False, True, True, False, True, 
           True, False, True, True, True, True, False, True, 
           False, False, False, True, False, False, True, False, 
           True, False, True, True, False, False, False, True, 
           False, False, False, True, False, False, False, False, 
           False, False, False, True, False, True, True, True, 
           False, False, True, False, True, True, True, False, 
           True, True, False, True, True, True, True, False, 
           False, True, False, False, False, False, False, False, 
           True, False, True, False),
         Count => (0, 0, 0, 0, 0, 0, 1, 0, 2, 0),
         Unknown => (False, False, False, False, False, False, False, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E025 := E025 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E068 := E068 + 1;
      Ada.Strings'Elab_Spec;
      E052 := E052 + 1;
      Ada.Containers'Elab_Spec;
      E040 := E040 + 1;
      System.Exceptions'Elab_Spec;
      E027 := E027 + 1;
      Interfaces.C'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E072 := E072 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E058 := E058 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E021 := E021 + 1;
      E013 := E013 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      E047 := E047 + 1;
      E078 := E078 + 1;
      E054 := E054 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      E080 := E080 + 1;
      Ada.Numerics'Elab_Spec;
      E104 := E104 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E005 := E005 + 1;
      Ada.Streams'Elab_Spec;
      E143 := E143 + 1;
      Interfaces.C.Strings'Elab_Spec;
      E112 := E112 + 1;
      System.File_Control_Block'Elab_Spec;
      E151 := E151 + 1;
      System.Finalization_Root'Elab_Spec;
      E150 := E150 + 1;
      Ada.Finalization'Elab_Spec;
      E148 := E148 + 1;
      System.File_Io'Elab_Body;
      E147 := E147 + 1;
      System.Storage_Pools'Elab_Spec;
      E163 := E163 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E159 := E159 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E169 := E169 + 1;
      System.Task_Info'Elab_Spec;
      E127 := E127 + 1;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E367 := E367 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E106 := E106 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E141 := E141 + 1;
      System.Pool_Global'Elab_Spec;
      E165 := E165 + 1;
      System.Random_Seed'Elab_Body;
      E365 := E365 + 1;
      System.Tasking.Initialization'Elab_Body;
      E381 := E381 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E371 := E371 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E387 := E387 + 1;
      System.Tasking.Queuing'Elab_Body;
      E385 := E385 + 1;
      System.Tasking.Stages'Elab_Body;
      E377 := E377 + 1;
      Glib'Elab_Spec;
      Gtkada.Types'Elab_Spec;
      E154 := E154 + 1;
      E157 := E157 + 1;
      Gdk.Frame_Timings'Elab_Spec;
      Gdk.Frame_Timings'Elab_Body;
      E240 := E240 + 1;
      E194 := E194 + 1;
      Gdk.Visual'Elab_Body;
      E224 := E224 + 1;
      E196 := E196 + 1;
      E188 := E188 + 1;
      Glib.Object'Elab_Spec;
      Glib.Values'Elab_Body;
      E192 := E192 + 1;
      E180 := E180 + 1;
      E190 := E190 + 1;
      E182 := E182 + 1;
      Glib.Object'Elab_Body;
      E178 := E178 + 1;
      E208 := E208 + 1;
      E210 := E210 + 1;
      E214 := E214 + 1;
      Glib.Generic_Properties'Elab_Spec;
      Glib.Generic_Properties'Elab_Body;
      E176 := E176 + 1;
      Gdk.Color'Elab_Spec;
      E234 := E234 + 1;
      E216 := E216 + 1;
      E212 := E212 + 1;
      E343 := E343 + 1;
      E402 := E402 + 1;
      E226 := E226 + 1;
      E305 := E305 + 1;
      Glib.Variant'Elab_Spec;
      Glib.Variant'Elab_Body;
      E303 := E303 + 1;
      E301 := E301 + 1;
      Gtk.Builder'Elab_Spec;
      Gtk.Builder'Elab_Body;
      E248 := E248 + 1;
      E285 := E285 + 1;
      Gtk.Cell_Area_Context'Elab_Spec;
      Gtk.Cell_Area_Context'Elab_Body;
      E317 := E317 + 1;
      Gtk.Css_Section'Elab_Spec;
      Gtk.Css_Section'Elab_Body;
      E333 := E333 + 1;
      E228 := E228 + 1;
      Gtk.Orientable'Elab_Spec;
      E291 := E291 + 1;
      Gtk.Paper_Size'Elab_Spec;
      Gtk.Paper_Size'Elab_Body;
      E345 := E345 + 1;
      Gtk.Page_Setup'Elab_Spec;
      Gtk.Page_Setup'Elab_Body;
      E341 := E341 + 1;
      Gtk.Print_Settings'Elab_Spec;
      Gtk.Print_Settings'Elab_Body;
      E353 := E353 + 1;
      E256 := E256 + 1;
      Gtk.Target_List'Elab_Spec;
      Gtk.Target_List'Elab_Body;
      E254 := E254 + 1;
      E261 := E261 + 1;
      Pango.Attributes'Elab_Spec;
      Pango.Attributes'Elab_Body;
      E279 := E279 + 1;
      Pango.Font_Metrics'Elab_Spec;
      Pango.Font_Metrics'Elab_Body;
      E265 := E265 + 1;
      Pango.Language'Elab_Spec;
      Pango.Language'Elab_Body;
      E267 := E267 + 1;
      Pango.Font'Elab_Spec;
      Pango.Font'Elab_Body;
      E263 := E263 + 1;
      E359 := E359 + 1;
      Gtk.Text_Tag'Elab_Spec;
      Gtk.Text_Tag'Elab_Body;
      E361 := E361 + 1;
      Pango.Font_Face'Elab_Spec;
      Pango.Font_Face'Elab_Body;
      E271 := E271 + 1;
      Pango.Font_Family'Elab_Spec;
      Pango.Font_Family'Elab_Body;
      E269 := E269 + 1;
      Pango.Fontset'Elab_Spec;
      Pango.Fontset'Elab_Body;
      E273 := E273 + 1;
      E275 := E275 + 1;
      Pango.Context'Elab_Spec;
      Pango.Context'Elab_Body;
      E259 := E259 + 1;
      Pango.Font_Map'Elab_Spec;
      Pango.Font_Map'Elab_Body;
      E349 := E349 + 1;
      Pango.Tabs'Elab_Spec;
      Pango.Tabs'Elab_Body;
      E281 := E281 + 1;
      Pango.Layout'Elab_Spec;
      Pango.Layout'Elab_Body;
      E277 := E277 + 1;
      Gtk.Print_Context'Elab_Spec;
      Gtk.Print_Context'Elab_Body;
      E347 := E347 + 1;
      Gdk.Display'Elab_Spec;
      Gtk.Tree_Model'Elab_Spec;
      Gtk.Entry_Buffer'Elab_Spec;
      Gtk.Cell_Editable'Elab_Spec;
      Gtk.Adjustment'Elab_Spec;
      Gtk.Style'Elab_Spec;
      Gtk.Accel_Group'Elab_Spec;
      Gdk.Frame_Clock'Elab_Spec;
      Gdk.Pixbuf'Elab_Spec;
      Gtk.Icon_Source'Elab_Spec;
      Gtk.Icon_Source'Elab_Body;
      E329 := E329 + 1;
      E242 := E242 + 1;
      Gdk.Screen'Elab_Spec;
      Gdk.Screen'Elab_Body;
      E222 := E222 + 1;
      Gdk.Device'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Spec;
      Gdk.Drag_Contexts'Elab_Body;
      E236 := E236 + 1;
      Gdk.Device'Elab_Body;
      E202 := E202 + 1;
      E357 := E357 + 1;
      Gdk.Window'Elab_Spec;
      E295 := E295 + 1;
      Gtk.Selection_Data'Elab_Spec;
      Gtk.Selection_Data'Elab_Body;
      E250 := E250 + 1;
      Gtk.Widget'Elab_Spec;
      Gtk.Misc'Elab_Spec;
      Gtk.Misc'Elab_Body;
      E335 := E335 + 1;
      E230 := E230 + 1;
      Gtk.Settings'Elab_Spec;
      Gtk.Settings'Elab_Body;
      E220 := E220 + 1;
      Gtk.Style_Context'Elab_Spec;
      Gtk.Icon_Set'Elab_Spec;
      Gtk.Icon_Set'Elab_Body;
      E327 := E327 + 1;
      Gtk.Image'Elab_Spec;
      Gtk.Image'Elab_Body;
      E325 := E325 + 1;
      Gtk.Cell_Renderer'Elab_Spec;
      Gtk.Container'Elab_Spec;
      Gtk.Bin'Elab_Spec;
      Gtk.Bin'Elab_Body;
      E297 := E297 + 1;
      Gtk.Box'Elab_Spec;
      Gtk.Box'Elab_Body;
      E283 := E283 + 1;
      Gtk.Status_Bar'Elab_Spec;
      Gtk.Notebook'Elab_Spec;
      E319 := E319 + 1;
      Gtk.Cell_Area'Elab_Spec;
      Gtk.Entry_Completion'Elab_Spec;
      Gtk.Window'Elab_Spec;
      Gtk.Dialog'Elab_Spec;
      Gtk.Print_Operation'Elab_Spec;
      Gtk.Gentry'Elab_Spec;
      Gtk.Status_Bar'Elab_Body;
      E355 := E355 + 1;
      E351 := E351 + 1;
      Gtk.Print_Operation'Elab_Body;
      E339 := E339 + 1;
      Gtk.Notebook'Elab_Body;
      E337 := E337 + 1;
      Gtk.Style_Context'Elab_Body;
      E331 := E331 + 1;
      Gtk.Gentry'Elab_Body;
      E299 := E299 + 1;
      Gtk.Tree_Model'Elab_Body;
      E323 := E323 + 1;
      Gtk.Cell_Area'Elab_Body;
      E315 := E315 + 1;
      Gtk.Entry_Completion'Elab_Body;
      E313 := E313 + 1;
      Gtk.Cell_Renderer'Elab_Body;
      E321 := E321 + 1;
      Gtk.Entry_Buffer'Elab_Body;
      E311 := E311 + 1;
      E309 := E309 + 1;
      E307 := E307 + 1;
      Gtk.Window'Elab_Body;
      E293 := E293 + 1;
      Gtk.Dialog'Elab_Body;
      E218 := E218 + 1;
      Gtk.Adjustment'Elab_Body;
      E289 := E289 + 1;
      Gtk.Container'Elab_Body;
      E287 := E287 + 1;
      Gtk.Style'Elab_Body;
      E252 := E252 + 1;
      Gtk.Widget'Elab_Body;
      E232 := E232 + 1;
      Gtk.Accel_Group'Elab_Body;
      E246 := E246 + 1;
      Gdk.Frame_Clock'Elab_Body;
      E238 := E238 + 1;
      E206 := E206 + 1;
      Gdk.Display'Elab_Body;
      E204 := E204 + 1;
      Gtk.Drawing_Area'Elab_Spec;
      Gtk.Drawing_Area'Elab_Body;
      E400 := E400 + 1;
      E200 := E200 + 1;
      E398 := E398 + 1;
      game_spark'elab_spec;
      E396 := E396 + 1;
      game'elab_spec;
      game'elab_body;
      E103 := E103 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\DELL\Desktop\GUJA\snake\obj\main_quit.o
   --   C:\Users\DELL\Desktop\GUJA\snake\obj\snake_generic.o
   --   C:\Users\DELL\Desktop\GUJA\snake\obj\game_spark.o
   --   C:\Users\DELL\Desktop\GUJA\snake\obj\game.o
   --   C:\Users\DELL\Desktop\GUJA\snake\obj\main.o
   --   -LC:\Users\DELL\Desktop\GUJA\snake\obj\
   --   -LC:\Users\DELL\Desktop\GUJA\snake\obj\
   --   -LC:\GtkAda\lib\gtkada\gtkada.static\gtkada\
   --   -LC:/gnat/2018/lib/gcc/x86_64-pc-mingw32/7.3.1/adalib/
   --   -static
   --   -shared-libgcc
   --   -shared-libgcc
   --   -shared-libgcc
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
