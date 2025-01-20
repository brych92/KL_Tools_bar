<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" minScale="0" version="3.28.15-Firenze" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>0</Searchable>
    <Private>0</Private>
  </flags>
  <customproperties>
    <Option/>
  </customproperties>
  <renderer type="basic">
    <styles>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry) = 'Polygon') AND NOT(&quot;color&quot; IN ('tile-01', 'tile-20', 'tile-03', 'tile-05', 'tile-07', 'tile-09', 'tile-11', 'tile-15', 'tile-17', 'tile-26', 'tile-28', 'tile-30', 'tile-32', 'tile-35'))" name="Інше">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="183,40,140,73" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="125,25,45,131" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="PointPatternFill">
              <Option type="Map">
                <Option type="double" value="0" name="angle"/>
                <Option type="QString" value="shape" name="clip_mode"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="5" name="displacement_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_x_unit"/>
                <Option type="QString" value="0" name="displacement_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_y_unit"/>
                <Option type="QString" value="10" name="distance_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_x_unit"/>
                <Option type="QString" value="5" name="distance_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_y_unit"/>
                <Option type="QString" value="0" name="offset_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_x_unit"/>
                <Option type="QString" value="0" name="offset_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_y_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="0" name="random_deviation_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_x_unit"/>
                <Option type="QString" value="0" name="random_deviation_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_y_unit"/>
                <Option type="QString" value="934548098" name="seed"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="FontMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="?" name="chr"/>
                    <Option type="QString" value="255,0,0,255" name="color"/>
                    <Option type="QString" value="Arial" name="font"/>
                    <Option type="QString" value="Regular" name="font_style"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255" name="outline_color"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="4" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-01')" name="Території житлової садибної забудови">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,172,44,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="2" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="203,177,72,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-20')" name="Території рекреаційної забудови">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,172,44,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="4" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="144,184,85,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-03')" name="Території житлової середньо- та малоповерхової забудови">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,172,44,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="2" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="187,113,48,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="2" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0.5" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@2">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="187,113,48,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-05')" name="Території багатоповерхової житлової забудови">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,172,44,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="187,113,48,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0.5" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@2">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="187,113,48,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="1" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@3">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="187,113,48,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-07')" name="Території громадських будівель та споруд">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,44,44,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="191,49,75,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="-45" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@2">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="191,49,75,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-09')" name="Території промислові">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="158,66,195,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="4" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="152,152,152,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="4" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="1" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@2">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="152,152,152,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="90" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="2" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@3">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="152,152,152,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-11')" name="Території транспорту">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="122,166,195,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="57,90,168,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="3" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="1.5" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@2">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="57,90,168,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.26" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="1" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-15')" name="Території комунально-складські">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="158,66,195,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-17')" name="Території сільськогосподарські">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,186,156,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-26')" name="Території зелених насаджень загального користування">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="143,195,108,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-28')" name="Території захисного озеленення">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="143,195,108,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="PointPatternFill">
              <Option type="Map">
                <Option type="double" value="0" name="angle"/>
                <Option type="QString" value="shape" name="clip_mode"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="7.5" name="displacement_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_x_unit"/>
                <Option type="QString" value="0" name="displacement_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_y_unit"/>
                <Option type="QString" value="15" name="distance_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_x_unit"/>
                <Option type="QString" value="10" name="distance_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_y_unit"/>
                <Option type="QString" value="0" name="offset_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_x_unit"/>
                <Option type="QString" value="0" name="offset_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_y_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="0" name="random_deviation_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_x_unit"/>
                <Option type="QString" value="0" name="random_deviation_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_y_unit"/>
                <Option type="QString" value="532521290" name="seed"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SvgMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="68,126,62,255" name="color"/>
                    <Option type="QString" value="0" name="fixedAspectRatio"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="symbol/landuse_grass.svg" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255" name="outline_color"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option name="parameters"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="6" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-30')" name="Території лісів та лісопарків">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="143,195,108,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="PointPatternFill">
              <Option type="Map">
                <Option type="double" value="0" name="angle"/>
                <Option type="QString" value="shape" name="clip_mode"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="7.5" name="displacement_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_x_unit"/>
                <Option type="QString" value="0" name="displacement_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_y_unit"/>
                <Option type="QString" value="15" name="distance_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_x_unit"/>
                <Option type="QString" value="10" name="distance_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_y_unit"/>
                <Option type="QString" value="0" name="offset_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_x_unit"/>
                <Option type="QString" value="0" name="offset_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_y_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="0" name="random_deviation_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_x_unit"/>
                <Option type="QString" value="0" name="random_deviation_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_y_unit"/>
                <Option type="QString" value="69481776" name="seed"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SvgMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="68,126,62,255" name="color"/>
                    <Option type="QString" value="0" name="fixedAspectRatio"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="gpsicons/tree.svg" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="255,255,255,255" name="outline_color"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option name="parameters"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="3" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-32')" name="Території спецпризначення">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="182,195,171,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="LinePatternFill">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="during_render" name="clip_mode"/>
                <Option type="QString" value="0,0,255,255" name="color"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="2" name="distance"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_unit"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleLine">
                  <Option type="Map">
                    <Option type="QString" value="0" name="align_dash_pattern"/>
                    <Option type="QString" value="square" name="capstyle"/>
                    <Option type="QString" value="5;2" name="customdash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                    <Option type="QString" value="MM" name="customdash_unit"/>
                    <Option type="QString" value="0" name="dash_pattern_offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                    <Option type="QString" value="0" name="draw_inside_polygon"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="138,146,138,255" name="line_color"/>
                    <Option type="QString" value="solid" name="line_style"/>
                    <Option type="QString" value="0.3" name="line_width"/>
                    <Option type="QString" value="MM" name="line_width_unit"/>
                    <Option type="QString" value="0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="0" name="ring_filter"/>
                    <Option type="QString" value="0" name="trim_distance_end"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                    <Option type="QString" value="0" name="trim_distance_start"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                    <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                    <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                    <Option type="QString" value="0" name="use_custom_dash"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="10" geometry="2" max-zoom="-1" enabled="1" expression="(geometry_type($geometry)='Polygon')AND(&quot;color&quot;='tile-35')" name="Території кладовищ">
        <symbols>
          <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleFill">
              <Option type="Map">
                <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                <Option type="QString" value="195,194,185,66" name="color"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="148,148,148,188" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0.26" name="outline_width"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="solid" name="style"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="PointPatternFill">
              <Option type="Map">
                <Option type="double" value="0" name="angle"/>
                <Option type="QString" value="shape" name="clip_mode"/>
                <Option type="QString" value="viewport" name="coordinate_reference"/>
                <Option type="QString" value="0" name="displacement_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_x_unit"/>
                <Option type="QString" value="0" name="displacement_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="displacement_y_unit"/>
                <Option type="QString" value="5" name="distance_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_x_unit"/>
                <Option type="QString" value="5" name="distance_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="distance_y_unit"/>
                <Option type="QString" value="0" name="offset_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_x_unit"/>
                <Option type="QString" value="0" name="offset_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_y_unit"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="0" name="random_deviation_x"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_x_unit"/>
                <Option type="QString" value="0" name="random_deviation_y"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
                <Option type="QString" value="MM" name="random_deviation_y_unit"/>
                <Option type="QString" value="128970247" name="seed"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="@0@1">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="255,0,0,255" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="cross" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="13" geometry="1" max-zoom="-1" enabled="1" expression="geometry_type($geometry)='Line'" name="">
        <symbols>
          <symbol force_rhr="0" type="line" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="round" name="capstyle"/>
                <Option type="QString" value="5;2" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="round" name="joinstyle"/>
                <Option type="QString" value="35,35,35,255" name="line_color"/>
                <Option type="QString" value="solid" name="line_style"/>
                <Option type="QString" value="0.26" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="0" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;200000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                    <Option type="Map" name="outlineWidth">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="CASE &#xd;&#xa;WHEN @map_scale&lt;10000 THEN 2 &#xd;&#xa;WHEN @map_scale&lt;30000 THEN 1&#xd;&#xa;WHEN @map_scale&lt;100000 THEN 0.3&#xd;&#xa;else  0.1  &#xd;&#xa;END" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
            <layer pass="0" enabled="1" locked="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" value="0" name="align_dash_pattern"/>
                <Option type="QString" value="square" name="capstyle"/>
                <Option type="QString" value="3;3" name="customdash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
                <Option type="QString" value="MM" name="customdash_unit"/>
                <Option type="QString" value="0" name="dash_pattern_offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
                <Option type="QString" value="0" name="draw_inside_polygon"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="255,255,255,255" name="line_color"/>
                <Option type="QString" value="dot" name="line_style"/>
                <Option type="QString" value="0.05" name="line_width"/>
                <Option type="QString" value="MM" name="line_width_unit"/>
                <Option type="QString" value="0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="0" name="ring_filter"/>
                <Option type="QString" value="0" name="trim_distance_end"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_end_unit"/>
                <Option type="QString" value="0" name="trim_distance_start"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
                <Option type="QString" value="MM" name="trim_distance_start_unit"/>
                <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
                <Option type="QString" value="1" name="use_custom_dash"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option type="Map" name="properties">
                    <Option type="Map" name="enabled">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="@map_scale&lt;20000" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                    <Option type="Map" name="outlineWidth">
                      <Option type="bool" value="true" name="active"/>
                      <Option type="QString" value="0.192308*(CASE &#xd;&#xa;WHEN @map_scale&lt;10000 THEN 2 &#xd;&#xa;WHEN @map_scale&lt;50000 THEN 1&#xd;&#xa;WHEN @map_scale&lt;100000 THEN 0.3&#xd;&#xa;else  0.1  &#xd;&#xa;END)" name="expression"/>
                      <Option type="int" value="3" name="type"/>
                    </Option>
                  </Option>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </symbols>
      </style>
      <style layer="" min-zoom="-1" geometry="0" max-zoom="-1" enabled="0" expression="geometry_type($geometry)='Point'" name="">
        <symbols>
          <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="0">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
              <Option type="Map">
                <Option type="QString" value="0" name="angle"/>
                <Option type="QString" value="square" name="cap_style"/>
                <Option type="QString" value="213,180,60,255" name="color"/>
                <Option type="QString" value="1" name="horizontal_anchor_point"/>
                <Option type="QString" value="bevel" name="joinstyle"/>
                <Option type="QString" value="circle" name="name"/>
                <Option type="QString" value="0,0" name="offset"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                <Option type="QString" value="MM" name="offset_unit"/>
                <Option type="QString" value="35,35,35,255" name="outline_color"/>
                <Option type="QString" value="solid" name="outline_style"/>
                <Option type="QString" value="0" name="outline_width"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                <Option type="QString" value="MM" name="outline_width_unit"/>
                <Option type="QString" value="diameter" name="scale_method"/>
                <Option type="QString" value="2" name="size"/>
                <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                <Option type="QString" value="MM" name="size_unit"/>
                <Option type="QString" value="1" name="vertical_anchor_point"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" value="" name="name"/>
                  <Option name="properties"/>
                  <Option type="QString" value="collection" name="type"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </symbols>
      </style>
    </styles>
  </renderer>
  <labeling type="basic">
    <styles>
      <style layer="" min-zoom="14" geometry="0" max-zoom="-1" enabled="1" expression="geometry_type($geometry)='Point'" name="Підписи зон">
        <settings calloutType="simple">
          <text-style namedStyle="Regular" forcedItalic="0" forcedBold="0" fontUnderline="0" capitalization="0" isExpression="1" textColor="50,50,50,255" fontWeight="50" legendString="Aa" useSubstitutions="0" previewBkgrdColor="255,255,255,255" fontWordSpacing="0" allowHtml="0" multilineHeightUnit="Percentage" multilineHeight="1" fieldName="title" fontStrikeout="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSize="8" fontKerning="1" fontLetterSpacing="0" textOrientation="horizontal" fontSizeUnit="Point" fontFamily="Arial" textOpacity="1" blendMode="0" fontItalic="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferSize="0.5" bufferColor="250,250,250,255" bufferSizeUnits="MM" bufferJoinStyle="128" bufferDraw="1" bufferNoFill="1" bufferOpacity="0.58399999999999996" bufferSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <text-mask maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128" maskSizeUnits="MM" maskSize="0" maskedSymbolLayers="" maskEnabled="0" maskType="0" maskOpacity="1"/>
            <background shapeSizeUnit="Point" shapeOffsetY="0" shapeSizeType="0" shapeDraw="0" shapeBorderWidthUnit="Point" shapeSVGFile="" shapeRotation="0" shapeOffsetUnit="Point" shapeRadiiX="0" shapeRadiiUnit="Point" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeBlendMode="0" shapeSizeX="0" shapeOffsetX="0" shapeType="0" shapeRotationType="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0">
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="164,113,88,255" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleFill">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowRadiusUnit="MM" shadowOpacity="0.69999999999999996" shadowOffsetGlobal="1" shadowScale="100" shadowColor="0,0,0,255" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetAngle="135" shadowDraw="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format multilineAlign="1" placeDirectionSymbol="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" plussign="0" formatNumbers="0" decimals="3" wrapChar="" leftDirectionSymbol="&lt;" autoWrapLength="20" reverseDirectionSymbol="0"/>
          <placement lineAnchorClipping="0" lineAnchorPercent="0.5" offsetUnits="MM" dist="0" centroidWhole="0" distUnits="MM" geometryGenerator="" layerType="PointGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="0" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" fitInPolygonOnly="0" repeatDistance="0" xOffset="0" repeatDistanceUnits="MM" polygonPlacementFlags="2" lineAnchorType="0" overlapHandling="PreventOverlap" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" placement="1" overrunDistanceUnit="MM" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" maxCurvedCharAngleOut="-25" quadOffset="4" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" rotationAngle="0" centroidInside="0" allowDegraded="0" priority="5" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" geometryGeneratorType="PointGeometry"/>
          <rendering zIndex="0" scaleMax="50000" unplacedVisibility="0" fontMaxPixelSize="10000" upsidedownLabels="0" obstacleType="1" mergeLines="0" obstacle="1" scaleMin="0" minFeatureSize="0" obstacleFactor="1" fontMinPixelSize="3" scaleVisibility="1" fontLimitPixelSize="0" drawLabels="1" limitNumLabels="0" labelPerPart="0" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol force_rhr=&quot;0&quot; type=&quot;line&quot; frame_rate=&quot;10&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; enabled=&quot;1&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </style>
      <style layer="" min-zoom="14" geometry="1" max-zoom="-1" enabled="1" expression="geometry_type($geometry)='Line'" name="Назви вулиць">
        <settings calloutType="simple">
          <text-style namedStyle="Regular" forcedItalic="0" forcedBold="0" fontUnderline="0" capitalization="0" isExpression="1" textColor="50,50,50,255" fontWeight="50" legendString="Aa" useSubstitutions="0" previewBkgrdColor="255,255,255,255" fontWordSpacing="0" allowHtml="0" multilineHeightUnit="Percentage" multilineHeight="1" fieldName="name" fontStrikeout="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSize="10" fontKerning="1" fontLetterSpacing="0" textOrientation="horizontal" fontSizeUnit="Point" fontFamily="Arial" textOpacity="1" blendMode="0" fontItalic="0">
            <families/>
            <text-buffer bufferBlendMode="0" bufferSize="0.5" bufferColor="250,250,250,255" bufferSizeUnits="MM" bufferJoinStyle="128" bufferDraw="1" bufferNoFill="1" bufferOpacity="0.502" bufferSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <text-mask maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128" maskSizeUnits="MM" maskSize="0" maskedSymbolLayers="" maskEnabled="0" maskType="0" maskOpacity="1"/>
            <background shapeSizeUnit="Point" shapeOffsetY="0" shapeSizeType="0" shapeDraw="0" shapeBorderWidthUnit="Point" shapeSVGFile="" shapeRotation="0" shapeOffsetUnit="Point" shapeRadiiX="0" shapeRadiiUnit="Point" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeBlendMode="0" shapeSizeX="0" shapeOffsetX="0" shapeType="0" shapeRotationType="0" shapeSizeY="0" shapeBorderWidth="0" shapeRadiiY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeFillColor="255,255,255,255" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0">
              <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleMarker">
                  <Option type="Map">
                    <Option type="QString" value="0" name="angle"/>
                    <Option type="QString" value="square" name="cap_style"/>
                    <Option type="QString" value="114,155,111,255" name="color"/>
                    <Option type="QString" value="1" name="horizontal_anchor_point"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="circle" name="name"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="35,35,35,255" name="outline_color"/>
                    <Option type="QString" value="solid" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
                    <Option type="QString" value="MM" name="outline_width_unit"/>
                    <Option type="QString" value="diameter" name="scale_method"/>
                    <Option type="QString" value="2" name="size"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
                    <Option type="QString" value="MM" name="size_unit"/>
                    <Option type="QString" value="1" name="vertical_anchor_point"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
              <symbol force_rhr="0" type="fill" frame_rate="10" clip_to_extent="1" alpha="1" is_animated="0" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option type="QString" value="" name="name"/>
                    <Option name="properties"/>
                    <Option type="QString" value="collection" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" enabled="1" locked="0" class="SimpleFill">
                  <Option type="Map">
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
                    <Option type="QString" value="255,255,255,255" name="color"/>
                    <Option type="QString" value="bevel" name="joinstyle"/>
                    <Option type="QString" value="0,0" name="offset"/>
                    <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
                    <Option type="QString" value="MM" name="offset_unit"/>
                    <Option type="QString" value="128,128,128,255" name="outline_color"/>
                    <Option type="QString" value="no" name="outline_style"/>
                    <Option type="QString" value="0" name="outline_width"/>
                    <Option type="QString" value="Point" name="outline_width_unit"/>
                    <Option type="QString" value="solid" name="style"/>
                  </Option>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" value="" name="name"/>
                      <Option name="properties"/>
                      <Option type="QString" value="collection" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowUnder="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowRadiusUnit="MM" shadowOpacity="0.69999999999999996" shadowOffsetGlobal="1" shadowScale="100" shadowColor="0,0,0,255" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetAngle="135" shadowDraw="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format multilineAlign="0" placeDirectionSymbol="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" plussign="0" formatNumbers="0" decimals="3" wrapChar="" leftDirectionSymbol="&lt;" autoWrapLength="0" reverseDirectionSymbol="0"/>
          <placement lineAnchorClipping="0" lineAnchorPercent="0.5" offsetUnits="MM" dist="0" centroidWhole="0" distUnits="MM" geometryGenerator="" layerType="LineGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" maxCurvedCharAngleIn="25" geometryGeneratorEnabled="0" lineAnchorTextPoint="FollowPlacement" overrunDistance="0" fitInPolygonOnly="0" repeatDistance="0" xOffset="0" repeatDistanceUnits="MM" polygonPlacementFlags="2" lineAnchorType="0" overlapHandling="PreventOverlap" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" placement="3" overrunDistanceUnit="MM" preserveRotation="1" distMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" maxCurvedCharAngleOut="-25" quadOffset="4" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetType="0" rotationAngle="0" centroidInside="0" allowDegraded="0" priority="5" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" geometryGeneratorType="PointGeometry"/>
          <rendering zIndex="0" scaleMax="30000" unplacedVisibility="0" fontMaxPixelSize="10000" upsidedownLabels="0" obstacleType="1" mergeLines="0" obstacle="1" scaleMin="0" minFeatureSize="0" obstacleFactor="1" fontMinPixelSize="3" scaleVisibility="1" fontLimitPixelSize="0" drawLabels="1" limitNumLabels="0" labelPerPart="0" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol force_rhr=&quot;0&quot; type=&quot;line&quot; frame_rate=&quot;10&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; enabled=&quot;1&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="double" value="0" name="offsetFromAnchor"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
              <Option type="double" value="0" name="offsetFromLabel"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
              <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </style>
    </styles>
  </labeling>
  <blendMode>0</blendMode>
  <layerOpacity>1</layerOpacity>
</qgis>
