function chineseMachineryPanel()
    % 创建主窗口
    fig = uifigure('Name', '机械参数计算面板', 'Position', [100 100 1000 500]);
    
    % 全局变量，用于存储选择
    handles = struct();
    
    % 左侧面板 - 输入参数
    leftPanel = uipanel(fig, 'Position', [10 10 200 480], 'Title', '输入参数');
    
    yPos = 430;
    spacing = 35;
    
    % 创建输入字段
    uilabel(leftPanel, 'Position', [10 yPos 80 22], 'Text', '模数m');
    handles.edit_m = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 2);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 100 22], 'Text', '小齿轮齿数z1');
    handles.edit_z1 = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 34);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 100 22], 'Text', '大齿轮齿数z2');
    handles.edit_z2 = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 109);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 100 22], 'Text', '小齿轮齿宽b');
    handles.edit_b = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 68);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 80 22], 'Text', '精度等级');
    handles.edit_jd = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 7);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 80 22], 'Text', '功率(kW)');
    handles.edit_gonglv = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 10);
    
    yPos = yPos - spacing;
    handles.bg_zhuanxiang = uibuttongroup(leftPanel, 'Position', [10 yPos 180 25], 'BorderType', 'none');
    uiradiobutton(handles.bg_zhuanxiang, 'Position', [5 2 50 22], 'Text', '转速', 'Tag', 'speed');
    uiradiobutton(handles.bg_zhuanxiang, 'Position', [80 2 80 22], 'Text', '角速度', 'Tag', 'angular');
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 80 22], 'Text', '转速n(rpm)');
    handles.edit_speed = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 960);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 120 22], 'Text', '变位系数x1');
    handles.edit_x1 = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 0.502);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 120 22], 'Text', '变位系数x2');
    handles.edit_x2 = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 0.5503);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 130 22], 'Text', '润滑油粘度(50℃)');
    handles.edit_nianDu = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 100);
    
    yPos = yPos - spacing;
    uilabel(leftPanel, 'Position', [10 yPos 120 22], 'Text', '应力循环次数');
    handles.edit_yingLi = uieditfield(leftPanel, 'numeric', 'Position', [105 yPos 85 22], 'Value', 4e9);
    
    % 中间面板 - 配置选项
    midPanel = uipanel(fig, 'Position', [220 10 240 480], 'Title', '工作配置');
    
    % 工作情况
    workPanel = uipanel(midPanel, 'Position', [10 325 220 130], 'Title', '工作情况');
    
    % 原动机
    yuanPanel = uipanel(workPanel, 'Position', [10 10 95 90], 'Title', '原动机');
    handles.bg_yuan = uibuttongroup(yuanPanel, 'Position', [5 5 85 60], 'BorderType', 'none');
    uiradiobutton(handles.bg_yuan, 'Position', [5 45 70 18], 'Text', '均匀平稳', 'Tag', '1');
    uiradiobutton(handles.bg_yuan, 'Position', [5 30 70 18], 'Text', '轻微震动', 'Tag', '2');
    uiradiobutton(handles.bg_yuan, 'Position', [5 15 70 18], 'Text', '中等震动', 'Tag', '3');
    uiradiobutton(handles.bg_yuan, 'Position', [5 0 70 18], 'Text', '剧烈震动', 'Tag', '4');
    
    % 工作机
    gongPanel = uipanel(workPanel, 'Position', [115 10 95 90], 'Title', '工作机');
    handles.bg_gong = uibuttongroup(gongPanel, 'Position', [5 5 85 60], 'BorderType', 'none');
    uiradiobutton(handles.bg_gong, 'Position', [5 45 70 18], 'Text', '均匀平稳', 'Tag', '1');
    uiradiobutton(handles.bg_gong, 'Position', [5 30 70 18], 'Text', '轻微震动', 'Tag', '2');
    uiradiobutton(handles.bg_gong, 'Position', [5 15 70 18], 'Text', '中等震动', 'Tag', '3');
    uiradiobutton(handles.bg_gong, 'Position', [5 0 70 18], 'Text', '剧烈震动', 'Tag', '4');

    % 齿合方式
    chihePanel = uipanel(midPanel, 'Position', [10 255 110 65], 'Title', '齿合方式');
    handles.bg_chihe = uibuttongroup(chihePanel, 'Position', [5 2 100 40], 'BorderType', 'none');
    uiradiobutton(handles.bg_chihe, 'Position', [5 25 90 18], 'Text', '内啮合', 'Tag', 'internal');
    uiradiobutton(handles.bg_chihe, 'Position', [5 5 90 18], 'Text', '外啮合', 'Tag', 'external');
    
    % 齿轮配置调整
    peizhiPanel = uipanel(midPanel, 'Position', [130 255 100 65], 'Title', '齿轮配置调整');
    handles.bg_peizhi = uibuttongroup(peizhiPanel, 'Position', [5 2 90 40], 'BorderType', 'none');
    uiradiobutton(handles.bg_peizhi, 'Position', [5 25 90 18], 'Text', '无', 'Tag', 'none');
    uiradiobutton(handles.bg_peizhi, 'Position', [5 5 90 18], 'Text', '是', 'Tag', 'yes');
    
    % 螺旋角
    luoxuanPanel = uipanel(midPanel, 'Position', [10 180 110 65], 'Title', '螺旋角');
    handles.bg_luoxuan = uibuttongroup(luoxuanPanel, 'Position', [5 2 100 40], 'BorderType', 'none');
    handles.rb_zhichi = uiradiobutton(handles.bg_luoxuan, 'Position', [5 25 90 15], 'Text', '直齿轮', 'Tag', 'straight');
    handles.rb_xiechi = uiradiobutton(handles.bg_luoxuan, 'Position', [5 5 90 15], 'Text', '斜齿轮', 'Tag', 'helical');
    
    uilabel(midPanel, 'Position', [135 215 90 22], 'Text', '螺旋角β(度)');
    handles.edit_beta = uieditfield(midPanel, 'numeric', 'Position', [135 195 90 22], 'Value', 0, 'Enable', 'off');
    
    handles.bg_luoxuan.SelectionChangedFcn = @helicalAngleChanged;
    
    % 布局及限制条件
    bujuPanel = uipanel(midPanel, 'Position', [10 105 220 65], 'Title', '布局及限制条件');
    handles.bg_buju = uibuttongroup(bujuPanel, 'Position', [5 0 210 40], 'BorderType', 'none');
    uiradiobutton(handles.bg_buju, 'Position', [5 25 80 18], 'Text', '无限支撑', 'Tag', '1');
    uiradiobutton(handles.bg_buju, 'Position', [75 25 80 18], 'Text', '单悬臂支撑', 'Tag', '2');
    uiradiobutton(handles.bg_buju, 'Position', [5 5 80 18], 'Text', '受垂直支撑', 'Tag', '3');
    
    % 是否允许齿根点蚀
    chigenPanel = uipanel(midPanel, 'Position', [10 30 220 70], 'Title', '是否允许齿根点蚀');
    handles.bg_chigen = uibuttongroup(chigenPanel, 'Position', [5 5 100 40], 'BorderType', 'none');
    uiradiobutton(handles.bg_chigen, 'Position', [5 25 90 18], 'Text', '是', 'Tag', 'yes');
    uiradiobutton(handles.bg_chigen, 'Position', [5 5 90 18], 'Text', '否', 'Tag', 'no');

    % 右侧面板 - 材料选择
    rightPanel = uipanel(fig, 'Position', [470 10 380 480], 'Title', '材料选择');
    
    % 选材材料
    materialPanel = uipanel(rightPanel, 'Position', [10 150 360 305], 'Title', '选材材料');
    
    % 小齿轮 - 所有材料的单选按钮组
    xiaochiPanel = uipanel(materialPanel, 'Position', [10 165 340 110], 'Title', '小齿轮');
    handles.bg_xiaochi = uibuttongroup(xiaochiPanel, 'Position', [5 5 330 80], 'BorderType', 'none');
    
    uiradiobutton(handles.bg_xiaochi, 'Position', [5 60 70 18], 'Text', 'HT250', 'Tag', 'HT250');
    uiradiobutton(handles.bg_xiaochi, 'Position', [80 60 80 18], 'Text', 'QT600-2', 'Tag', 'QT600-2');
    uiradiobutton(handles.bg_xiaochi, 'Position', [5 40 70 18], 'Text', 'HT300', 'Tag', 'HT300');
    uiradiobutton(handles.bg_xiaochi, 'Position', [80 40 80 18], 'Text', 'ZG310-570', 'Tag', 'ZG310-570');
    uiradiobutton(handles.bg_xiaochi, 'Position', [5 20 70 18], 'Text', 'HT350', 'Tag', 'HT350');
    uiradiobutton(handles.bg_xiaochi, 'Position', [80 20 80 18], 'Text', 'ZG340-640', 'Tag', 'ZG340-640');
    uiradiobutton(handles.bg_xiaochi, 'Position', [5 0 70 18], 'Text', 'QT500-5', 'Tag', 'QT500-5');
    uiradiobutton(handles.bg_xiaochi, 'Position', [80 0 80 18], 'Text', '45', 'Tag', '45');
    
    % 小齿轮右侧材料
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 60 70 18], 'Text', '30CrMnSi', 'Tag', '30CrMnSi');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 60 80 18], 'Text', '12Cr2Ni4', 'Tag', '12Cr2Ni4');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 40 70 18], 'Text', '40Cr', 'Tag', '40Cr');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 40 80 18], 'Text', '20Cr2Ni4', 'Tag', '20Cr2Ni4');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 20 70 18], 'Text', '20Cr', 'Tag', '20Cr');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 20 80 18], 'Text', '35CrAlA', 'Tag', '35CrAlA');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 0 70 18], 'Text', '20CrMnTi', 'Tag', '20CrMnTi');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 0 80 18], 'Text', '38CrMoAlA', 'Tag', '38CrMoAlA');
    
    % 大齿轮 - 所有材料的单选按钮组
    dachiPanel = uipanel(materialPanel, 'Position', [10 5 340 155], 'Title', '大齿轮');
    handles.bg_dachi = uibuttongroup(dachiPanel, 'Position', [5 5 330 125], 'BorderType', 'none');
    
    uiradiobutton(handles.bg_dachi, 'Position', [5 110 70 18], 'Text', 'HT250', 'Tag', 'HT250');
    uiradiobutton(handles.bg_dachi, 'Position', [80 110 80 18], 'Text', 'ZG310-570', 'Tag', 'ZG310-570');
    uiradiobutton(handles.bg_dachi, 'Position', [5 90 70 18], 'Text', 'HT300', 'Tag', 'HT300');
    uiradiobutton(handles.bg_dachi, 'Position', [80 90 80 18], 'Text', 'ZG340-640', 'Tag', 'ZG340-640');
    uiradiobutton(handles.bg_dachi, 'Position', [5 70 70 18], 'Text', 'HT350', 'Tag', 'HT350');
    uiradiobutton(handles.bg_dachi, 'Position', [80 70 80 18], 'Text', '45', 'Tag', '45');
    uiradiobutton(handles.bg_dachi, 'Position', [5 50 70 18], 'Text', 'QT500-5', 'Tag', 'QT500-5');
    uiradiobutton(handles.bg_dachi, 'Position', [80 50 80 18], 'Text', '30CrMnSi', 'Tag', '30CrMnSi');
    uiradiobutton(handles.bg_dachi, 'Position', [5 30 70 18], 'Text', 'QT600-2', 'Tag', 'QT600-2');
    uiradiobutton(handles.bg_dachi, 'Position', [80 30 80 18], 'Text', '35SiMn', 'Tag', '35SiMn');
    
    % 大齿轮右侧材料
    uiradiobutton(handles.bg_dachi, 'Position', [170 110 75 18], 'Text', '38SiMnMo', 'Tag', '38SiMnMo');
    uiradiobutton(handles.bg_dachi, 'Position', [250 110 80 18], 'Text', '20Cr2Ni4', 'Tag', '20Cr2Ni4');
    uiradiobutton(handles.bg_dachi, 'Position', [170 90 70 18], 'Text', '40Cr', 'Tag', '40Cr');
    uiradiobutton(handles.bg_dachi, 'Position', [250 90 80 18], 'Text', '35CrAlA', 'Tag', '35CrAlA');
    uiradiobutton(handles.bg_dachi, 'Position', [170 70 70 18], 'Text', '20Cr', 'Tag', '20Cr');
    uiradiobutton(handles.bg_dachi, 'Position', [250 70 80 18], 'Text', '38CrMoAlA', 'Tag', '38CrMoAlA');
    uiradiobutton(handles.bg_dachi, 'Position', [170 50 70 18], 'Text', '20CrMnTi', 'Tag', '20CrMnTi');
    uiradiobutton(handles.bg_dachi, 'Position', [250 50 80 18], 'Text', '标准塑料', 'Tag', 'plastic');
    uiradiobutton(handles.bg_dachi, 'Position', [170 30 70 18], 'Text', '12Cr2Ni4', 'Tag', '12Cr2Ni4');
    
    % 自定义材料按钮
    handles.btn_custom = uibutton(materialPanel, 'Position', [260 15 80 25], 'Text', '自定义材料', ...
        'ButtonPushedFcn', @customMaterialDialog);
    
    % 材料属性（用于计算的隐藏输入）
    handles.edit_hbs1 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 250);
    handles.edit_hbs2 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 230);
    handles.edit_hlim1 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 600);
    handles.edit_hlim2 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 550);
    
    % 设置材料选择回调函数
    handles.bg_xiaochi.SelectionChangedFcn = @updateMaterial1;
    handles.bg_dachi.SelectionChangedFcn = @updateMaterial2;
    
    % 最右侧面板
    farRightPanel = uipanel(fig, 'Position', [860 10 130 480], 'Title', '热处理');
    
    % 可靠度
    kekaoDuPanel = uipanel(farRightPanel, 'Position', [10 350 110 105], 'Title', '可靠度');
    handles.bg_kekao = uibuttongroup(kekaoDuPanel, 'Position', [5 5 100 75], 'BorderType', 'none');
    uiradiobutton(handles.bg_kekao, 'Position', [5 60 90 18], 'Text', '高可靠度', 'Tag', '0.99');
    uiradiobutton(handles.bg_kekao, 'Position', [5 40 90 18], 'Text', '较高可靠度', 'Tag', '0.95');
    uiradiobutton(handles.bg_kekao, 'Position', [5 20 90 18], 'Text', '一般可靠度', 'Tag', '0.90');
    uiradiobutton(handles.bg_kekao, 'Position', [5 0 90 18], 'Text', '低可靠度', 'Tag', '0.85');
    
    % 齿面处理
    rechuliPanel = uipanel(farRightPanel, 'Position', [10 50 110 290], 'Title', '齿面处理');
    
    % 软硬齿面
    handles.bg_chachi = uibuttongroup(rechuliPanel, 'Position', [5 205 100 60], 'BorderType', 'none', 'Title', '齿面类型');
    uiradiobutton(handles.bg_chachi, 'Position', [5 20 80 18], 'Text', '软齿面', 'Tag', 'soft');
    uiradiobutton(handles.bg_chachi, 'Position', [5 0 80 18], 'Text', '硬齿面', 'Tag', 'hard');
    
    % 热处理方式
    handles.bg_rechuli = uibuttongroup(rechuliPanel, 'Position', [5 5 100 190], 'BorderType', 'none', 'Title', '热处理方式');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 150 80 18], 'Text', '无', 'Tag', 'none');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 130 80 18], 'Text', '调质', 'Tag', 'quench');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 110 80 18], 'Text', '正火', 'Tag', 'normalize');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 90 80 18], 'Text', '退火', 'Tag', 'anneal');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 70 80 18], 'Text', '渗碳淬火', 'Tag', 'carburize');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 50 80 18], 'Text', '表面淬火', 'Tag', 'surface');
    uiradiobutton(handles.bg_rechuli, 'Position', [5 30 80 18], 'Text', '氮化', 'Tag', 'nitride');
    
    % 计算按钮和结果显示在右侧面板（第3列）- 底部，并排显示
    handles.btn_calc_stress = uibutton(rightPanel, 'Position', [10 115 150 30], 'Text', '计算接触应力',...
        'ButtonPushedFcn', @calculateContactStress);
    
    handles.text_result_H = uieditfield(rightPanel, 'text', 'Position', [180 115 100 30], 'Value', '', ...
        'Editable', 'off', 'BackgroundColor', [1 1 1]);
    
    handles.btn_calc_allow = uibutton(rightPanel, 'Position', [10 80 150 30], 'Text', '计算许用接触应力',...
        'ButtonPushedFcn', @calculateAllowableStress);
    
    handles.text_result_HP = uieditfield(rightPanel, 'text', 'Position', [180 80 100 30], 'Value', '', ...
        'Editable', 'off', 'BackgroundColor', [1 1 1]);
    
    % 将句柄存储在图形中
    fig.UserData = handles;
end

function helicalAngleChanged(src, event)
    % 从图形获取句柄
    % src 是 uibuttongroup -> Parent 是 panel -> Parent 是 midPanel -> Parent 是 fig
    fig = src.Parent.Parent.Parent;
    handles = fig.UserData;
    
    selected = handles.bg_luoxuan.SelectedObject;
    if strcmp(selected.Tag, 'helical')
        handles.edit_beta.Enable = 'on';
        if handles.edit_beta.Value == 0
            handles.edit_beta.Value = 12.578;
        end
    else
        handles.edit_beta.Enable = 'off';
        handles.edit_beta.Value = 0;
    end
end

function calculateContactStress(btn, event)
    % 根据 GB/ISO 标准计算实际接触应力 σH
    % 匹配参考代码单位约定：保持尺寸单位为 mm
    % 使用 Ftcount 函数计算 Ft 和 v（匹配参考实现）
    % 
    % 单选按钮映射（机械状态）：
    %   bg_chihe: 'internal'/'external' → 影响应力公式中的 (u±1)/u 项
    %   bg_luoxuan: 'straight'/'helical' → 影响 β（螺旋角）、Zh、Zab
    %   bg_yuan: 原动机类型 (1-4) → 影响 KA（应用系数）
    %   bg_gong: 工作机类型 (1-4) → 影响 KA（应用系数）
    %   edit_jd: 精度等级 → 影响 KV（动载系数）、KHb
    %
    try
        % 查找图形
        fig = btn.Parent;
        while ~isempty(fig) && ~isa(fig, 'matlab.ui.Figure')
            fig = fig.Parent;
        end
        if isempty(fig)
            error('Could not find figure handle');
        end
        handles = fig.UserData;

        % --- 输入（保持原始单位：mm、kW、rpm）---
        mn = handles.edit_m.Value;         % 模数 (mm)
        z1 = handles.edit_z1.Value;
        z2 = handles.edit_z2.Value;
        b = handles.edit_b.Value;          % 齿宽 (mm) - 保持为 mm
        P_kW = handles.edit_gonglv.Value;  % 功率 (kW)
        n = handles.edit_speed.Value;      % 转速 (rpm)
        beta_deg = handles.edit_beta.Value; % 螺旋角 (度)

        % 几何参数（从模数和齿数计算 d1，保持为 mm）
        % 注意：假设斜齿轮使用法向模数
        % 对于法向模数：d1 = mn * z1 / cos(beta)
        % 对于端面模数：d1 = mn * z1（其中 mn 是端面模数）
        beta = beta_deg * pi/180;  % 转换为弧度
        if beta == 0
            d1 = mn * z1;  % 直齿轮：模数为端面模数
        else
            d1 = mn * z1 / cos(beta);  % 斜齿轮：假设为法向模数（标准）
        end
        u = z2 / z1;

        % 使用 Ftcount 函数计算 Ft 和 v（匹配参考代码）
        chilun = struct();
        chilun.mn = mn;
        chilun.z1 = z1;
        chilun.B = beta_deg;  % degrees
        chilun.nw = n;         % rpm
        chilun.p = P_kW;       % kW
        chilun.d1 = d1;        % mm（预先计算）
        
        [Ft, v] = Ftcount(chilun);  % Ft 单位为 N，v 单位为 m/s

        % 获取无量纲系数（现有辅助函数）
        i = str2double(handles.bg_yuan.SelectedObject.Tag);
        j = str2double(handles.bg_gong.SelectedObject.Tag);
        KA = getKA(i, j);
        KV = getKV(v, handles.edit_jd.Value);
        KHa = getKHa(b / d1);  % 比值为无量纲
        KHb = getKHb(b, d1, handles.edit_jd.Value);
        Zh = getZh(beta, z1, z2);
        Zab = getZab(beta, z1, z2, mn, b);  % 传递齿宽 b 以正确计算 epsilon_beta

        % 弹性系数 Ze (MPa^0.5) - 从材料属性计算
        % 对于钢-钢：E ≈ 210000 MPa，ν ≈ 0.30 → Ze ≈ 340 MPa^0.5
        % 使用默认钢-钢属性（可扩展为其他材料）
        Ze = computeZe([], []);  % 对于钢-钢返回 ~340

        % 确定内啮合或外啮合
        isInternal = strcmp(handles.bg_chihe.SelectedObject.Tag, 'internal');

        % ---------- 诊断输出 ----------
        fprintf('---- DIAGNOSTIC ----\n');
        fprintf('Inputs: mn=%.6g, z1=%.6g, z2=%.6g, b(mm)=%.6g, P_kW=%.6g, n(rpm)=%.6g, beta(deg)=%.6g, jd=%g\n', ...
            mn, z1, z2, b, P_kW, n, handles.edit_beta.Value, handles.edit_jd.Value);

        fprintf('d1 (mm) = %.6g\n', d1);
        fprintf('d1 (m) = %.6g\n', d1/1000);
        fprintf('u = z2/z1 = %.6g\n', u);

        fprintf('Ft (N) = %.6g\n', Ft);
        fprintf('v (m/s) = %.6g\n', v);

        % 系数
        fprintf('KA = %.6g, KV = %.6g, KHa = %.6g, KHb = %.6g\n', KA, KV, KHa, KHb);
        fprintf('Ze = %.6g, Zh = %.6g, Zab = %.6g\n', Ze, Zh, Zab);
        
        % 接触比的附加诊断（如果可从 getZab 获得）
        % 注意：epsilon 值在 getZab 内部计算，但我们可以重新计算用于显示
        if beta == 0
            epsilon_alpha = 1.6 + 0.001 * (z1 + z2);
            epsilon_beta = 0;
        else
            epsilon_alpha = 1.6 + 0.001 * (z1 + z2);
            epsilon_beta = (b / mn) * abs(tan(beta)) / pi;
        end
        epsilon = epsilon_alpha + epsilon_beta;
        fprintf('Contact ratio: epsilon_alpha = %.6g, epsilon_beta = %.6g, epsilon_total = %.6g\n', ...
            epsilon_alpha, epsilon_beta, epsilon);

        % 分支和 sqrt 内的因子
        if isInternal
            fprintf('Branch: INTERNAL (use (u-1)/u)\n');
            % 完全按照公式计算 sqrt 内的值
            X = Ft * (u-1) / (b * d1 * u) * KA * KV * KHa * KHb;
        else
            fprintf('Branch: EXTERNAL (use (u+1)/u)\n');
            % 完全按照公式计算 sqrt 内的值
            X = Ft / b / d1 * (u+1) / u * KA * KV * KHa * KHb;
        end
        fprintf('Inside sqrt X = %.12g\n', X);
        fprintf('sqrt(X) = %.12g\n', sqrt(X));
        fprintf('sigmaH = Ze * Zh * Zab * sqrt(X) = %.12g MPa\n', Ze * Zh * Zab * sqrt(X));

        % 与报告值比较
        fprintf('reported handles.text_result_H = %s\n', handles.text_result_H.Value);
        fprintf('---------------------\n');

        % 使用参考公式精确计算接触应力
        % 单位：Ft[N], b[mm], d1[mm] → Ft/(b*d1) = N/mm² = MPa（直接）
        if isInternal
            % 内啮合：H = Ze * Zh * Zab * sqrt(Ft*(u-1)/(b*d1*u) * KA*KV*KHa*KHb)
            sigmaH = Ze * Zh * Zab * sqrt(Ft * (u-1) / (b * d1 * u) * KA * KV * KHa * KHb);
        else
            % 外啮合：H = Ze * Zh * Zab * sqrt(Ft/b/d1 * (u+1)/u * KA*KV*KHa*KHb)
            sigmaH = Ze * Zh * Zab * sqrt(Ft / b / d1 * (u+1) / u * KA * KV * KHa * KHb);
        end
        % 结果已经是 MPa（因为 Ft[N]/(b[mm]*d1[mm]) = N/mm² = MPa）

        handles.text_result_H.Value = sprintf('%.4f', sigmaH);

        % 可选：如果存在许用值则进行比较
        if ~isempty(handles.text_result_HP.Value) && ~strcmp(handles.text_result_HP.Value, '')
            HP = str2double(handles.text_result_HP.Value);
            if sigmaH <= HP
                % 通过
            else
                % 失败
            end
        end
        
    catch ME
        uialert(fig, ME.message, '计算错误');
    end
end

function calculateAllowableStress(btn, event)
    % 根据 GB/ISO 标准计算许用接触应力 [σH]
    %
    % 单选按钮映射（机械状态）：
    %   bg_kekao: 可靠度 (0.85, 0.90, 0.95, 0.99) → 影响 ZR（可靠度系数）
    %   bg_luoxuan: 'straight'/'helical' → 影响速度计算中的 β
    %   edit_yingLi: 应力循环次数 N → 影响 ZNT（寿命系数）
    %   edit_m: 模数 → 影响 ZX（尺寸系数）
    %   edit_speed: 转速 → 影响 ZW（速度系数）
    %
    try
        % 查找图形
        fig = btn.Parent;
        while ~isempty(fig) && ~isa(fig, 'matlab.ui.Figure')
            fig = fig.Parent;
        end
        if isempty(fig)
            error('Could not find figure handle');
        end
        handles = fig.UserData;

        % 寿命循环次数
        N = handles.edit_yingLi.Value;
        
        % 材料极限 Hlim（单位：MPa）
        Hlim1 = handles.edit_hlim1.Value;
        Hlim2 = handles.edit_hlim2.Value;
        
        % 可靠度系数 — 将可靠度标签转换为 ZR（可靠度折减系数）
        % ZR 应 ≤ 1.0，对于更高可靠度要求会降低许用应力
        reliabilityTag = str2double(handles.bg_kekao.SelectedObject.Tag);
        % 标准映射：50%→1.00, 90%→0.90, 95%→0.85, 99%→0.80
        if reliabilityTag >= 0.99
            ZR = 0.80;  % 高可靠度 (99%+) - 将许用应力降低 20%
        elseif reliabilityTag >= 0.95
            ZR = 0.85;  % 较高可靠度 (95-99%) - 降低 15%
        elseif reliabilityTag >= 0.90
            ZR = 0.90;  % 一般可靠度 (90-95%) - 降低 10%
        else
            ZR = 1.00;  % 低可靠度 (<90%) - 无折减
        end

        % 安全系数 SF（接触应力通常为 1.0-1.5）
        % 使用标准值 1.0（可根据应用要求调整）
        SF = 1.0;

        % 寿命系数和其他无量纲系数
        ZNT = getZNT(N);
        ZLVR = 1.0;  % 润滑/寿命系数（简化）

        % 速度系数 ZW - 一致地计算速度
        mn = handles.edit_m.Value;
        z1 = handles.edit_z1.Value;
        beta_deg = handles.edit_beta.Value;
        beta = beta_deg * pi/180;
        % 使用与 calculateContactStress 中相同的 d1 计算
        if beta == 0
            d1_mm = mn * z1;  % 直齿轮
        else
            d1_mm = mn * z1 / cos(beta);  % 斜齿轮（法向模数）
        end
        v = pi * d1_mm * handles.edit_speed.Value / 60000;  % 线速度，单位 m/s
        ZW = getZW(v);
        
        % 尺寸系数 ZX
        ZX = getZX(mn);
        
        % 计算许用接触应力 [σH]（单位：MPa）
        % 公式：[σH] = σHlim × ZNT × ZLV × ZW × ZX × ZR / SF
        % 其中：ZR 是可靠度折减系数（相乘，高可靠度时 <1.0）
        %       SF 是安全系数（相除，通常为 1.0-1.5）
        HP1 = Hlim1 * ZNT * ZLVR * ZW * ZX * ZR / SF;
        HP2 = Hlim2 * ZNT * ZLVR * ZW * ZX * ZR / SF;

        % ---------- 许用应力诊断输出 ----------
        fprintf('---- ALLOWABLE STRESS DIAGNOSTIC ----\n');
        fprintf('Inputs: N=%.6g, Hlim1=%.6g MPa, Hlim2=%.6g MPa, reliability=%.3f\n', ...
            N, Hlim1, Hlim2, reliabilityTag);
        fprintf('d1 (mm) = %.6g, v (m/s) = %.6g\n', d1_mm, v);
        fprintf('Factors: ZNT=%.6g, ZLVR=%.6g, ZW=%.6g, ZX=%.6g, ZR=%.6g, SF=%.6g\n', ...
            ZNT, ZLVR, ZW, ZX, ZR, SF);
        fprintf('HP1 = Hlim1 * ZNT * ZLVR * ZW * ZX * ZR / SF = %.6g MPa\n', HP1);
        fprintf('HP2 = Hlim2 * ZNT * ZLVR * ZW * ZX * ZR / SF = %.6g MPa\n', HP2);
        fprintf('HP (min) = %.6g MPa\n', min(HP1, HP2));
        fprintf('----------------------------------------\n');

        % 使用较小值（保守方法）
        HP = min(HP1, HP2);
        
        handles.text_result_HP.Value = sprintf('%.4f', HP);

        % 可选：如果存在当前接触应力则进行比较
        if ~isempty(handles.text_result_H.Value) && ~strcmp(handles.text_result_H.Value, '')
            sigmaH = str2double(handles.text_result_H.Value);  % MPa
            if sigmaH <= HP
                % 通过
            else
                % 失败
            end
        end
        
    catch ME
        uialert(fig, ME.message, '计算错误');
    end
end


function updateMaterial1(src, event)
    % 根据选择更新小齿轮的材料属性
    % 从图形获取句柄 - 向上导航：uibuttongroup -> xiaochiPanel -> materialPanel -> rightPanel -> fig
    fig = src.Parent.Parent.Parent.Parent;
    handles = fig.UserData;
    
    % 检查是否已选择
    if isempty(src.SelectedObject)
        return;
    end
    
    materialTag = event.NewValue.Tag;
    [hbs, ~] = getMaterialProperties(materialTag);  % 获取基础 HBS
    
    % 获取热处理选择（如果可用）
    heatTreatment = 'none';  % 默认值
    if isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % 考虑热处理计算 Hlim
    hlim = getHlimFromCategory(materialTag, hbs, heatTreatment);
    
    handles.edit_hbs1.Value = hbs;
    handles.edit_hlim1.Value = hlim;
end

function updateMaterial2(src, event)
    % 根据选择更新大齿轮的材料属性
    % 从图形获取句柄 - 向上导航：uibuttongroup -> dachiPanel -> materialPanel -> rightPanel -> fig
    fig = src.Parent.Parent.Parent.Parent;
    handles = fig.UserData;
    
    % 检查是否已选择
    if isempty(src.SelectedObject)
        return;
    end
    
    materialTag = event.NewValue.Tag;
    [hbs, ~] = getMaterialProperties(materialTag);  % 获取基础 HBS
    
    % 获取热处理选择（如果可用）
    heatTreatment = 'none';  % 默认值
    if isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % 考虑热处理计算 Hlim
    hlim = getHlimFromCategory(materialTag, hbs, heatTreatment);
    
    handles.edit_hbs2.Value = hbs;
    handles.edit_hlim2.Value = hlim;
end

function [hbs, hlim] = getMaterialProperties(materialTag)
    % 材料属性数据库
    % 返回 [HBS 硬度, Hlim 接触疲劳极限，单位：MPa]
    
    materialDB = containers.Map();
    materialDB('HT250') = [200, 500];
    materialDB('HT300') = [220, 550];
    materialDB('HT350') = [240, 600];
    materialDB('QT500-5') = [180, 550];
    materialDB('QT600-2') = [200, 600];
    materialDB('ZG310-570') = [160, 550];
    materialDB('ZG340-640') = [180, 600];
    materialDB('45') = [200, 600];
    materialDB('30CrMnSi') = [250, 700];
    materialDB('35SiMn') = [220, 650];
    materialDB('38SiMnMo') = [240, 700];
    materialDB('40Cr') = [240, 700];
    materialDB('20Cr') = [200, 650];
    materialDB('20CrMnTi') = [280, 800];
    materialDB('12Cr2Ni4') = [300, 900];
    materialDB('20Cr2Ni4') = [320, 950];
    materialDB('35CrAlA') = [300, 850];
    materialDB('38CrMoAlA') = [320, 900];
    materialDB('plastic') = [50, 200];
    
    if materialDB.isKey(materialTag)
        props = materialDB(materialTag);
        hbs = props(1);
        hlim = props(2);
    else
        % 默认值
        hbs = 250;
        hlim = 600;
    end
end


function customMaterialDialog(btn, event)
    % 带材料选择的自定义材料输入对话框
    % btn 应该是位于图形中的 uicontrol/uibutton
    %
    % 此版本具有鲁棒性：如果 fig.UserData 或
    % handles.edit_hbs1 缺失，不会报错。它提供安全的默认值。

    % --- 查找包含按钮的顶层图形（鲁棒）---
    fig = [];
    try
        parentObj = btn;
        % 向上遍历 Parent 链直到找到 matlab.ui.Figure
        while ~isempty(parentObj) && ~isa(parentObj,'matlab.ui.Figure')
            if isempty(parentObj.Parent)
                break;
            end
            parentObj = parentObj.Parent;
        end
        if isa(parentObj,'matlab.ui.Figure')
            fig = parentObj;
        end
    catch
        % 回退为空
        fig = [];
    end

    % 如果存在，尝试从图形 UserData 读取句柄
    handles = [];
    if ~isempty(fig) && isprop(fig,'UserData')
        try
            handles = fig.UserData;
        catch
            handles = [];
        end
    end

    % --- 创建对话框图形 ---
    % 更大的对话框高度以便底部控件可见
    d = uifigure('Name', 'zidingyi', 'Position', [400 300 450 450]);

    % 主面板：齿轮材料（顶部）
    mainPanel = uipanel(d, 'Position', [20 230 410 200], 'Title', '齿轮材料');

    % 小齿轮子面板（第1列）
    xiaochiSubPanel = uipanel(mainPanel, 'Position', [10 10 180 160], 'Title', '小齿轮');
    bg_xiaochi_custom = uibuttongroup(xiaochiSubPanel, 'Position', [5 5 170 130], 'BorderType', 'none');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 110 80 18], 'Text', '钢', 'Tag', 'steel_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 90 80 18], 'Text', '铸钢', 'Tag', 'caststeel_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 70 80 18], 'Text', '球墨铸铁', 'Tag', 'ductile_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 50 80 18], 'Text', '铸铁', 'Tag', 'cast_small');

    % 大齿轮子面板（第2列）
    dachiSubPanel = uipanel(mainPanel, 'Position', [200 10 200 160], 'Title', '大齿轮');
    bg_dachi_custom = uibuttongroup(dachiSubPanel, 'Position', [5 5 190 130], 'BorderType', 'none');
    uiradiobutton(bg_dachi_custom, 'Position', [5 110 90 18], 'Text', '钢', 'Tag', 'steel_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 90 90 18], 'Text', '铸钢', 'Tag', 'caststeel_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 70 90 18], 'Text', '球墨铸铁', 'Tag', 'ductile_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 50 90 18], 'Text', '铸铁', 'Tag', 'cast_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 30 90 18], 'Text', '锡青铜', 'Tag', 'bronze_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 10 90 18], 'Text', '织物层压塑料', 'Tag', 'plastic_large');

    % 单个硬度 HBS 输入字段（主面板下方，左侧）
    uilabel(d, 'Position', [20 180 60 22], 'Text', '硬度HBS', 'Visible', 'on');

    % 如果可用，安全地从句柄获取编辑字段的默认值
    defaultHBS = [];
    if ~isempty(handles)
        try
            if isfield(handles, 'edit_hbs1')
                % handles.edit_hbs1 可能是 uieditfield 或数值 - 两种情况都要处理
                val = handles.edit_hbs1;
                if isobject(val) && isprop(val,'Value')
                    defaultHBS = val.Value;
                elseif isnumeric(val)
                    defaultHBS = val;
                end
            end
        catch
            defaultHBS = [];
        end
    end
    if isempty(defaultHBS)
        defaultHBS = 0; % 安全回退值
    end

    % 创建数值编辑字段（现在不会报错）
    edit_hbs_custom = uieditfield(d, 'numeric', ...
        'Position', [90 180 100 22], ...
        'Value', defaultHBS, ...
        'Visible', 'on');

    % 返回按钮（右侧，水平对齐）
    uibutton(d, ...
        'Position', [300 175 110 35], ...
        'Text', '返回', ...
        'Visible', 'on', ...
        'ButtonPushedFcn', @(btn2,event2) updateCustomMaterialFromDialog(fig, bg_xiaochi_custom, bg_dachi_custom, ...
        edit_hbs_custom, d));
end


function updateCustomMaterialFromDialog(fig, bg_xiaochi_custom, bg_dachi_custom, edit_hbs_custom, dialog)
    % 如果可用，安全地从图形获取句柄
    handles = [];
    if ~isempty(fig) && isprop(fig,'UserData')
        try
            handles = fig.UserData;
        catch
            handles = [];
        end
    end
    
    % 获取单个 HBS 值（用于两个齿轮）
    hbs = edit_hbs_custom.Value;
    
    % 获取热处理选择（如果可用）
    heatTreatment = 'none';  % 默认值
    if ~isempty(handles) && isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % 获取选定的材料类型并考虑热处理计算 Hlim
    if ~isempty(bg_xiaochi_custom.SelectedObject)
        material1_tag = bg_xiaochi_custom.SelectedObject.Tag;
        hlim1 = getHlimFromCategory(material1_tag, hbs, heatTreatment);
    else
        % 如果未选择则使用默认值
        hlim1 = 600;
    end
    
    if ~isempty(bg_dachi_custom.SelectedObject)
        material2_tag = bg_dachi_custom.SelectedObject.Tag;
        hlim2 = getHlimFromCategory(material2_tag, hbs, heatTreatment);
    else
        % 如果未选择则使用默认值
        hlim2 = 600;
    end
    
    % 更新主 GUI - 两个齿轮使用相同的 HBS（仅当句柄存在时）
    if ~isempty(handles)
        try
            if isfield(handles, 'edit_hbs1') && isobject(handles.edit_hbs1) && isprop(handles.edit_hbs1, 'Value')
                handles.edit_hbs1.Value = hbs;
            end
            if isfield(handles, 'edit_hbs2') && isobject(handles.edit_hbs2) && isprop(handles.edit_hbs2, 'Value')
                handles.edit_hbs2.Value = hbs;
            end
            if isfield(handles, 'edit_hlim1') && isobject(handles.edit_hlim1) && isprop(handles.edit_hlim1, 'Value')
                handles.edit_hlim1.Value = hlim1;
            end
            if isfield(handles, 'edit_hlim2') && isobject(handles.edit_hlim2) && isprop(handles.edit_hlim2, 'Value')
                handles.edit_hlim2.Value = hlim2;
            end
        catch
            % 如果无法更新则静默失败
        end
    end
    
    close(dialog);
end

function hlim = getHlimFromCategory(materialTag, hbs, heatTreatment)
    % 根据材料类别、HBS 硬度和热处理计算 Hlim
    % 材料类别：steel, carburized, ductile, cast, caststeel, bronze, plastic
    % 热处理：'none', 'quench', 'normalize', 'anneal', 'carburize', 'surface', 'nitride'
    
    % 如果未提供则使用默认热处理
    if nargin < 3 || isempty(heatTreatment)
        heatTreatment = 'none';
    end
    
    % 从材料和 HBS 计算基础 Hlim
    if contains(materialTag, 'steel') || contains(materialTag, 'carburized')
        % 钢和渗碳钢：基础 Hlim ≈ 2.5 * HBS + 100
        base_hlim = 2.5 * hbs + 100;
        base_hlim = max(base_hlim, 500); % 最小值
        base_hlim = min(base_hlim, 1200); % 最大值
    elseif contains(materialTag, 'ductile')
        % 球墨铸铁：Hlim ≈ 2.0 * HBS + 150
        base_hlim = 2.0 * hbs + 150;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 800);
    elseif contains(materialTag, 'cast') && ~contains(materialTag, 'caststeel')
        % 铸铁：Hlim ≈ 1.8 * HBS + 100
        base_hlim = 1.8 * hbs + 100;
        base_hlim = max(base_hlim, 400);
        base_hlim = min(base_hlim, 700);
    elseif contains(materialTag, 'caststeel')
        % 铸钢：Hlim ≈ 2.2 * HBS + 120
        base_hlim = 2.2 * hbs + 120;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 900);
    elseif contains(materialTag, 'bronze')
        % 锡青铜：Hlim ≈ 1.5 * HBS + 50
        base_hlim = 1.5 * hbs + 50;
        base_hlim = max(base_hlim, 200);
        base_hlim = min(base_hlim, 400);
    elseif contains(materialTag, 'plastic')
        % 织物层压塑料：Hlim ≈ 0.8 * HBS + 50
        base_hlim = 0.8 * hbs + 50;
        base_hlim = max(base_hlim, 100);
        base_hlim = min(base_hlim, 250);
    else
        % 默认（类钢）
        base_hlim = 2.0 * hbs + 100;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 1000);
    end
    
    % 对基础 Hlim 应用热处理乘数
    % 热处理显著影响接触疲劳强度
    switch heatTreatment
        case 'carburize'
            % 渗碳淬火：显著增加 Hlim（通常为 1.2-1.3 倍）
            hlim = base_hlim * 1.25;
        case 'surface'
            % 表面淬火：增加 Hlim（通常为 1.15-1.2 倍）
            hlim = base_hlim * 1.18;
        case 'nitride'
            % 氮化：增加 Hlim（通常为 1.1-1.15 倍）
            hlim = base_hlim * 1.12;
        case 'quench'
            % 调质：适度增加（通常为 1.05-1.1 倍）
            hlim = base_hlim * 1.08;
        case 'normalize'
            % 正火：轻微增加（通常为 1.02-1.05 倍）
            hlim = base_hlim * 1.03;
        case 'anneal'
            % 退火：轻微减少或无变化（通常为 0.98-1.0 倍）
            hlim = base_hlim * 0.99;
        case 'none'
            % 无：无变化
            hlim = base_hlim;
        otherwise
            % 未知处理：使用基础值
            hlim = base_hlim;
    end
    
    % 最终限制到合理范围
    hlim = max(hlim, 200);
    hlim = min(hlim, 1500);
end

% 系数计算的辅助函数

function Ze = computeZe(material1, material2)
    % 从材料属性计算弹性系数 Ze
    % 输入：material1, material2 是结构体或标签（当前未使用，使用默认值）
    % 输出：Ze，单位 MPa^0.5
    % 
    % 对于钢-钢：E ≈ 210000 MPa，ν ≈ 0.30 → Ze ≈ 340 MPa^0.5
    % 公式：Ze = sqrt(1 / ((1-ν1²)/E1 + (1-ν2²)/E2))
    
    % 钢-钢的默认机械属性（单位：MPa）
    E1 = 210000;  % 杨氏模量（MPa）
    nu1 = 0.30;   % 泊松比
    E2 = 210000;  % 杨氏模量（MPa）
    nu2 = 0.30;   % 泊松比
    
    % TODO：如果您有材料特定的 E、nu，请根据材料标签在此处选择：
    % if isfield(material1,'E'), E1 = material1.E; end
    % if isfield(material1,'nu'), nu1 = material1.nu; end
    % 类似地处理 material2...
    
    % 按照 ISO 风格的弹性系数公式计算 Ze
    den = (1 - nu1^2)/E1 + (1 - nu2^2)/E2;
    Ze = sqrt(1 / den);  % 对于钢-钢给出 ~340 MPa^0.5
end

function [Ft, v] = Ftcount(chilun)
    % 计算切向力 Ft (N) 和线速度 v (m/s)
    % 匹配参考代码实现，正确处理单位
    % 输入：chilun 结构体，包含字段：
    %   - mn: 模数 (mm)
    %   - z1: 小齿轮齿数
    %   - B: 螺旋角（度），或 beta（弧度）
    %   - nw: 转速 (rpm)
    %   - p: 功率 (kW)
    %   - d1: 节圆直径 (mm) - 可选，如果未提供则计算
    %
    % 输出：
    %   - Ft: 切向力 (N)
    %   - v: 线速度 (m/s)
    
    PI = pi;
    
    % 获取 d1，单位 mm（使用提供的值或从模数和齿数计算）
    if isfield(chilun, 'd1') && ~isempty(chilun.d1)
        d1 = chilun.d1;  % mm（已计算）
    else
        % 从模数和齿数计算 d1
        if isfield(chilun, 'B') && chilun.B ~= 0
            beta = chilun.B * PI / 180;  % 将度转换为弧度
            d1 = chilun.mn * chilun.z1 / cos(beta);  % mm（斜齿轮）
        else
            d1 = chilun.mn * chilun.z1;  % mm（直齿轮）
    end
end

    n = chilun.nw;        % rpm
    P_kW = chilun.p;      % kW
    
    % 将 d1 从 mm 转换为 m 用于转矩计算
    d1_m = d1 / 1000;  % m
    
    % 角速度 (rad/s)
    omega = 2 * PI * n / 60;  % rad/s
    
    % 转矩 (N·m)
    P_W = P_kW * 1000;  % W
    T = P_W / omega;    % N·m
    
    % 切向力 Ft (N)
    Ft = 2 * T / d1_m;
    % 等价形式：Ft = 60000 * P_kW / (PI * n * d1_m);
    
    % 节圆线速度 v (m/s)
    % v = π * d1(mm) * n(rpm) / 60000 = m/s
    v = PI * d1 * n / 60000;  % m/s
end

function KA = getKA(i, j)
    % 基于原动机和工作机的应用系数
    ka = [1.00 1.25 1.50 1.75;
          1.10 1.35 1.60 1.85;
          1.25 1.50 1.75 2.00;
          1.50 1.75 2.00 2.25];
    KA = ka(i, j);
end

function KV = getKV(v, grade)
    % 动载系数（简化）
    % v: 速度，单位 m/s，grade: 精度等级
    if v <= 5
        KV = 1.0 + 0.05 * (10 - grade);
    elseif v <= 10
        KV = 1.1 + 0.07 * (10 - grade);
    else
        KV = 1.2 + 0.1 * (10 - grade);
    end
    KV = max(1.0, min(KV, 2.5));
end

function KHa = getKHa(bd_ratio)
    % 齿面载荷分布系数
    if bd_ratio <= 0.5
        KHa = 1.0;
    elseif bd_ratio <= 1.0
        KHa = 1.0 + 0.4 * (bd_ratio - 0.5);
    elseif bd_ratio <= 1.5
        KHa = 1.2 + 0.4 * (bd_ratio - 1.0);
    else
        KHa = 1.4 + 0.2 * (bd_ratio - 1.5);
    end
    KHa = min(KHa, 2.0);
end

function KHb = getKHb(b, d1, grade)
    % 横向载荷分布系数
    psi_d = b / d1;
    base = 1.0 + 0.15 * psi_d + 0.02 * (10 - grade);
    KHb = max(1.0, min(base, 2.0));
end

function Zh = getZh(beta, z1, z2)
    % 节点区域系数
    % 基于平均齿数和螺旋角的改进近似
    % Zh 通常在 1.9 到 2.9 之间，随齿数增加而减小
    
    Zm = (z1 + z2) / 2;  % 平均齿数
    
    % 基准 Zh（用于直齿轮或参考）
    Zh0 = 2.7 - 0.01 * Zm;
    
    % 螺旋角修正（斜齿轮的 Zh 略有不同）
    if beta == 0
        Zh = Zh0;  % 直齿轮
    else
        % 斜齿轮：根据螺旋角进行轻微调整
        Zh = Zh0 * (1 + 0.02 * abs(sin(beta)));
    end
    
    % 限制到合理范围
    Zh = max(1.9, min(Zh, 2.9));
end

function Zab = getZab(beta, z1, z2, mn, b)
    % 重合度系数
    % 基于总重合度 epsilon = epsilon_alpha + epsilon_beta 计算 Zab
    % 输入：beta（弧度）、z1、z2、mn（法向模数，单位 mm）、b（齿宽，单位 mm）
    
    % 端面压力角
    alpha_n = 20 * pi/180;  % 法向压力角（标准）
    if beta == 0
        alpha_t = alpha_n;  % 直齿轮
    else
        alpha_t = atan(tan(alpha_n) / cos(beta));  % 端面压力角
    end
    
    % 端面重合度 epsilon_alpha（基准近似）
    % 对于标准全齿高，通常为 1.6-2.0
    epsilon_alpha = 1.6 + 0.001 * (z1 + z2);  % 保守基准
    
    % 轴向重合度 epsilon_beta（斜齿轮贡献）
    if beta == 0
        epsilon_beta = 0;  % 直齿轮无轴向重叠
    else
        % 轴向重叠：epsilon_beta = (b * tan(beta)) / (π * mn)
        % 这是轴向重合度的工程近似
        epsilon_beta = (b / mn) * abs(tan(beta)) / pi;
    end
    
    % 总重合度
    epsilon = epsilon_alpha + epsilon_beta;
    
    % 将重合度 epsilon 映射到 Zab 系数
    % Zab 通常在 0.6 到 1.0 之间，随 epsilon 增加而增加
    % 映射：epsilon ~1.0 → Zab ~0.6，epsilon ~2.5 → Zab ~1.0
    if epsilon <= 1.0
        Zab = 0.6;
    elseif epsilon >= 2.5
        Zab = 1.0;
    else
        % 在 epsilon 1.0 和 2.5 之间线性插值
        Zab = 0.5 + 0.35 * ((epsilon - 1.0) / 1.5);
    end
    
    % 限制到标准范围
    Zab = max(0.6, min(Zab, 1.1));
end

function ZNT = getZNT(N)
    % 寿命系数
    if N >= 1e8
        ZNT = 1.0;
    elseif N >= 1e7
        ZNT = 1.0 + 0.05 * log10(1e8/N);
    else
        ZNT = 1.1 + 0.1 * log10(1e7/N);
    end
    ZNT = min(ZNT, 1.6);
end

function ZW = getZW(v)
    % 速度系数
    if v <= 5
        ZW = 1.0;
    elseif v <= 10
        ZW = 0.95 + 0.01 * (10 - v);
    else
        ZW = 0.85 + 0.01 * (15 - v);
    end
    ZW = max(0.85, min(ZW, 1.05));
end

function ZX = getZX(mn)
    % 尺寸系数
    if mn <= 5
        ZX = 1.0;
    elseif mn <= 10
        ZX = 1.0 - 0.015 * (mn - 5);
    else
        ZX = 0.925 - 0.01 * (mn - 10);
    end
    ZX = max(0.85, min(ZX, 1.0));
end

function ZR = getReliabilityFactor(reliability)
    % 根据 GB/ISO 标准的可靠度折减系数 (ZR)
    % 更高可靠度 → 更低 ZR → 更低许用应力
    % 这是一个乘性系数（<1.0），用于降低许用应力
    % GB1356-88 / ISO 6336-2 的标准映射：
    %   50% 可靠度 → ZR = 1.00
    %   90% 可靠度 → ZR = 0.90
    %   95% 可靠度 → ZR = 0.85
    %   99% 可靠度 → ZR = 0.80
    
    if reliability >= 0.99
        ZR = 0.80; % 高可靠度 (99%+) - 将许用应力降低 20%
    elseif reliability >= 0.95
        ZR = 0.85; % 较高可靠度 (95-99%) - 降低 15%
    elseif reliability >= 0.90
        ZR = 0.90; % 一般可靠度 (90-95%) - 降低 10%
    else
        ZR = 1.00; % 低可靠度 (<90%) - 无折减
    end
end