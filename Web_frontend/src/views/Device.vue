<template>
  <div style="max-height: calc(100vh - 60px);height: calc(100vh - 60px);">
   <div style="font-size:36px;text-align: center;font-weight: 600">
      餐厅设备控制
    </div>
    <el-row :gutter="30"  style="height: 80vh;width: 100%" type="">
      <el-col :span="6"><div class="grid-content" >
        <div style="text-align: center;font-size: 24px;font-weight: 500">
          学生一餐厅
        </div>
        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>前台照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value01"  @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value02"  @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value03" @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value04" @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>门禁开启</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value05" @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>门禁关闭</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value06" @change="(val) => changeSwitch(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>北侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>南侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>壁灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车4</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车5</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>换气扇1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

      </div></el-col>

      <el-col :span="6"><div class="grid-content" >
        <div style="text-align: center;font-size: 24px;font-weight: 500">
          学生二餐厅
        </div>
        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>前台照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value11"   @change="(val) => changeSwitch02(val)" ></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value12"   @change="(val) => changeSwitch02(val)"></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1"disabled ></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>入口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>出口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>北侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>南侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>壁灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车4</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车5</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>换气扇1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

      </div></el-col>

      <el-col :span="6"><div class="grid-content" >
        <div style="text-align: center;font-size: 24px;font-weight: 500">
          学生三餐厅
        </div>
        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>前台照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1"  disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1"  disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>入口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>出口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>北侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>南侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>壁灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车4</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车5</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>换气扇1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

      </div></el-col>

      <el-col :span="6"><div class="grid-content" >
        <div style="text-align: center;font-size: 24px;font-weight: 500">
          美食广场
        </div>
        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>前台照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1"  disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1"  disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>大厅照明3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>入口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>出口照明</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>北侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>南侧射灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>壁灯</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车3</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车4</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>消毒餐车5</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>洗碗机2</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

        <div class="row1">
          <el-row class="row1" ><div>
            <el-col :span="12">
              <div>换气扇1</div>
            </el-col>
            <el-col :span="12">
              <div>
                <el-switch v-model="value1" disabled></el-switch>
              </div>
            </el-col>
          </div></el-row>
        </div>

      </div></el-col>





    </el-row>


  </div>

</template>

<script>
import request from "@/utils/request";

export default {
  name: "Device",
  data() {
    return {
      value01:false,
      value02:false,
      value03:false,
      value04:false,
      value05:false,
      value06:false,
      value11:false,
      value12:false,
      value1: false,
      value2: false,
    }
  },
  methods:{
    changeSwitch(val){
      if(this.value05&&this.value06){
        this.value05=false
        this.value06=false
      }
      console.log(typeof val)
      var sat01
      sat01 = this.value01.toString() + ","+this.value02.toString()+ ","+this.value03.toString()+ ","+this.value04.toString()+ ","+this.value05.toString()+ ","+this.value06.toString()

      console.log(sat01)
      request.get("http://localhost:9090/test/sendMqtt",{
        params:{
          sendData :sat01,
          topic :"hello",
        }
      })
    },
    changeSwitch02(val){
      console.log("hello,device2")
      var sat01
      sat01 = this.value11.toString() + ","+this.value12.toString()
      console.log(sat01)
      request.get("http://localhost:9090/test/sendMqtt",{
        params:{
          sendData :sat01,
          topic :"control01",
        }
      })


    }
  }
}
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
  height: 100px;
  width: 100vh;
  /*border: indianred solid 1px;*/
}
.el-col {
  border-radius: 4px;
  height: 100%;
  /*border: indianred solid 1px;*/
}
.grid-content{
  /*background-color: #043c6b;*/
  height: 100%;
  border-radius: 30px;
  border: gray solid 1px;
  box-shadow: 2px 0 6px rgb(0 21 41);
}
.row1{
  height: 30px;
  width: 100%;
  text-align: center
}

</style>