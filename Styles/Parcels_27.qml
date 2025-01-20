<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" version="3.16.12-Hannover" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>0</Searchable>
  </flags>
  <customproperties/>
  <renderer type="basic">
    <styles>
      <style max-zoom="-1" expression="geometry_type($geometry)='Polygon'" layer="land_polygons" enabled="1" min-zoom="-1" geometry="2" name="Polygons">
        <symbols>
          <symbol clip_to_extent="1" alpha="1" type="fill" name="0" force_rhr="0">
            <layer class="SimpleFill" pass="0" enabled="1" locked="0">
              <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
              <prop v="86,151,195,66" k="color"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="53,133,195,189" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0.26" k="outline_width"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="solid" k="style"/>
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
      <style max-zoom="-1" expression="" layer="land_polygons" enabled="1" min-zoom="-1" geometry="2" name="">
        <settings calloutType="simple">
          <text-style fieldName="cadnum" textOrientation="horizontal" fontUnderline="0" previewBkgrdColor="255,255,255,255" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" fontFamily="Arial" namedStyle="Regular" fontLetterSpacing="0" multilineHeight="1" fontKerning="1" fontStrikeout="0" fontWordSpacing="0" fontWeight="50" fontSize="10" blendMode="0" isExpression="1" textOpacity="1" textColor="0,0,0,255" capitalization="0" useSubstitutions="0" allowHtml="0" fontSizeUnit="Point">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferDraw="1" bufferColor="255,255,255,255" bufferNoFill="1" bufferBlendMode="0" bufferOpacity="0.9159999999999999" bufferSize="1" bufferSizeUnits="MM"/>
            <text-mask maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskOpacity="1" maskEnabled="0" maskSize="1.5" maskedSymbolLayers="" maskJoinStyle="128"/>
            <background shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeOpacity="1" shapeSizeUnit="MM" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeDraw="0" shapeRadiiY="0" shapeBorderWidth="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeOffsetUnit="MM" shapeSizeX="0" shapeRadiiX="0" shapeSVGFile="" shapeRotation="0" shapeBorderWidthUnit="MM" shapeRotationType="0" shapeSizeType="0" shapeOffsetX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeBlendMode="0" shapeOffsetY="0" shapeJoinStyle="64">
              <symbol clip_to_extent="1" alpha="1" type="marker" name="markerSymbol" force_rhr="0">
                <layer class="SimpleMarker" pass="0" enabled="1" locked="0">
                  <prop v="0" k="angle"/>
                  <prop v="190,178,151,255" k="color"/>
                  <prop v="1" k="horizontal_anchor_point"/>
                  <prop v="bevel" k="joinstyle"/>
                  <prop v="circle" k="name"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="35,35,35,255" k="outline_color"/>
                  <prop v="solid" k="outline_style"/>
                  <prop v="0" k="outline_width"/>
                  <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                  <prop v="MM" k="outline_width_unit"/>
                  <prop v="diameter" k="scale_method"/>
                  <prop v="2" k="size"/>
                  <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                  <prop v="MM" k="size_unit"/>
                  <prop v="1" k="vertical_anchor_point"/>
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
            <shadow shadowOffsetDist="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7" shadowUnder="0" shadowRadius="1.5" shadowRadiusUnit="MM" shadowOffsetAngle="135" shadowBlendMode="6" shadowOffsetGlobal="1" shadowRadiusAlphaOnly="0" shadowScale="100" shadowColor="0,0,0,255"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" formatNumbers="0" addDirectionSymbol="0" multilineAlign="3" rightDirectionSymbol=">" placeDirectionSymbol="0" plussign="0" autoWrapLength="0" useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" decimals="3"/>
          <placement overrunDistanceUnit="MM" lineAnchorPercent="0.5" dist="0" distMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" repeatDistanceUnits="MM" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationAngle="0" polygonPlacementFlags="2" preserveRotation="1" priority="5" geometryGeneratorType="PointGeometry" centroidWhole="0" yOffset="0" geometryGeneratorEnabled="0" centroidInside="0" fitInPolygonOnly="0" geometryGenerator="" placement="5" maxCurvedCharAngleIn="25" overrunDistance="0" offsetType="0" distUnits="MM" repeatDistance="0" lineAnchorType="0" layerType="PolygonGeometry" offsetUnits="MM" maxCurvedCharAngleOut="-25" xOffset="0" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR"/>
          <rendering scaleMax="500" minFeatureSize="0" obstacle="1" mergeLines="0" fontMinPixelSize="3" displayAll="0" labelPerPart="0" obstacleFactor="1" zIndex="0" fontLimitPixelSize="0" scaleVisibility="1" fontMaxPixelSize="10000" scaleMin="10" limitNumLabels="0" maxNumLabels="2000" upsidedownLabels="0" obstacleType="1" drawLabels="1"/>
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
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; type=&quot;line&quot; name=&quot;symbol&quot; force_rhr=&quot;0&quot;>&lt;layer class=&quot;SimpleLine&quot; pass=&quot;0&quot; enabled=&quot;1&quot; locked=&quot;0&quot;>&lt;prop v=&quot;0&quot; k=&quot;align_dash_pattern&quot;/>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;dash_pattern_offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;dash_pattern_offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
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
</qgis>
