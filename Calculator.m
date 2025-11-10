function chineseMachineryPanel()
    % Create main figure
    fig = uifigure('Name', '机械参数计算面板', 'Position', [100 100 1000 500]);
    
    % Global variables to store selections
    handles = struct();
    
    % Left Panel - Input Parameters
    leftPanel = uipanel(fig, 'Position', [10 10 200 480], 'Title', '输入参数');
    
    yPos = 430;
    spacing = 35;
    
    % Create input fields
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
    
    % Middle Panel - Configuration Options
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

    % Right Panel - Material Selection
    rightPanel = uipanel(fig, 'Position', [470 10 380 480], 'Title', '材料选择');
    
    % 选材材料
    materialPanel = uipanel(rightPanel, 'Position', [10 150 360 305], 'Title', '选材材料');
    
    % 小齿轮 - Single radio button group for all materials
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
    
    % Right side materials for 小齿轮
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 60 70 18], 'Text', '30CrMnSi', 'Tag', '30CrMnSi');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 60 80 18], 'Text', '12Cr2Ni4', 'Tag', '12Cr2Ni4');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 40 70 18], 'Text', '40Cr', 'Tag', '40Cr');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 40 80 18], 'Text', '20Cr2Ni4', 'Tag', '20Cr2Ni4');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 20 70 18], 'Text', '20Cr', 'Tag', '20Cr');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 20 80 18], 'Text', '35CrAlA', 'Tag', '35CrAlA');
    uiradiobutton(handles.bg_xiaochi, 'Position', [170 0 70 18], 'Text', '20CrMnTi', 'Tag', '20CrMnTi');
    uiradiobutton(handles.bg_xiaochi, 'Position', [250 0 80 18], 'Text', '38CrMoAlA', 'Tag', '38CrMoAlA');
    
    % 大齿轮 - Single radio button group for all materials
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
    
    % Right side for 大齿轮
    uiradiobutton(handles.bg_dachi, 'Position', [170 110 75 18], 'Text', '38SiMnMo', 'Tag', '38SiMnMo');
    uiradiobutton(handles.bg_dachi, 'Position', [250 110 80 18], 'Text', '20Cr2Ni4', 'Tag', '20Cr2Ni4');
    uiradiobutton(handles.bg_dachi, 'Position', [170 90 70 18], 'Text', '40Cr', 'Tag', '40Cr');
    uiradiobutton(handles.bg_dachi, 'Position', [250 90 80 18], 'Text', '35CrAlA', 'Tag', '35CrAlA');
    uiradiobutton(handles.bg_dachi, 'Position', [170 70 70 18], 'Text', '20Cr', 'Tag', '20Cr');
    uiradiobutton(handles.bg_dachi, 'Position', [250 70 80 18], 'Text', '38CrMoAlA', 'Tag', '38CrMoAlA');
    uiradiobutton(handles.bg_dachi, 'Position', [170 50 70 18], 'Text', '20CrMnTi', 'Tag', '20CrMnTi');
    uiradiobutton(handles.bg_dachi, 'Position', [250 50 80 18], 'Text', '标准塑料', 'Tag', 'plastic');
    uiradiobutton(handles.bg_dachi, 'Position', [170 30 70 18], 'Text', '12Cr2Ni4', 'Tag', '12Cr2Ni4');
    
    % 自定义材料 button
    handles.btn_custom = uibutton(materialPanel, 'Position', [260 15 80 25], 'Text', '自定义材料', ...
        'ButtonPushedFcn', @customMaterialDialog);
    
    % Material properties (hidden inputs for calculations)
    handles.edit_hbs1 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 250);
    handles.edit_hbs2 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 230);
    handles.edit_hlim1 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 600);
    handles.edit_hlim2 = uieditfield(rightPanel, 'numeric', 'Position', [10 190 0 0], 'Visible', 'off', 'Value', 550);
    
    % Set up material selection callbacks
    handles.bg_xiaochi.SelectionChangedFcn = @updateMaterial1;
    handles.bg_dachi.SelectionChangedFcn = @updateMaterial2;
    
    % Far Right Panel
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
    
    % Calculation Buttons and Results in Right Panel (Column 3) - at bottom, side by side
    handles.btn_calc_stress = uibutton(rightPanel, 'Position', [10 115 150 30], 'Text', '计算接触应力',...
        'ButtonPushedFcn', @calculateContactStress);
    
    handles.text_result_H = uieditfield(rightPanel, 'text', 'Position', [180 115 100 30], 'Value', '', ...
        'Editable', 'off', 'BackgroundColor', [1 1 1]);
    
    handles.btn_calc_allow = uibutton(rightPanel, 'Position', [10 80 150 30], 'Text', '计算许用接触应力',...
        'ButtonPushedFcn', @calculateAllowableStress);
    
    handles.text_result_HP = uieditfield(rightPanel, 'text', 'Position', [180 80 100 30], 'Value', '', ...
        'Editable', 'off', 'BackgroundColor', [1 1 1]);
    
    % Store handles in figure
    fig.UserData = handles;
end

function helicalAngleChanged(src, event)
    % Get handles from figure
    % src is uibuttongroup -> Parent is panel -> Parent is midPanel -> Parent is fig
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
    % Calculate actual contact stress σH according to GB/ISO standards
    % Matches reference code unit conventions: keep dimensions in mm
    % Uses Ftcount function to compute Ft and v (matching reference implementation)
    % 
    % Radio button mappings (mechanical states):
    %   bg_chihe: 'internal'/'external' → affects (u±1)/u term in stress formula
    %   bg_luoxuan: 'straight'/'helical' → affects β (helix angle), Zh, Zab
    %   bg_yuan: Prime mover type (1-4) → affects KA (application factor)
    %   bg_gong: Driven machine type (1-4) → affects KA (application factor)
    %   edit_jd: Precision grade → affects KV (dynamic factor), KHb
    %
    try
        % Find the figure
        fig = btn.Parent;
        while ~isempty(fig) && ~isa(fig, 'matlab.ui.Figure')
            fig = fig.Parent;
        end
        if isempty(fig)
            error('Could not find figure handle');
        end
        handles = fig.UserData;

        % --- Inputs (keep in original units: mm, kW, rpm) ---
        mn = handles.edit_m.Value;         % module (mm)
        z1 = handles.edit_z1.Value;
        z2 = handles.edit_z2.Value;
        b = handles.edit_b.Value;          % face width (mm) - keep in mm
        P_kW = handles.edit_gonglv.Value;  % power (kW)
        n = handles.edit_speed.Value;      % rpm
        beta_deg = handles.edit_beta.Value; % helix angle (degrees)

        % Geometry (compute d1 from module and teeth, keep in mm)
        % NOTE: Assuming normal module (法向模数) for helical gears
        % For normal module: d1 = mn * z1 / cos(beta)
        % For transverse module: d1 = mn * z1 (where mn is transverse module)
        beta = beta_deg * pi/180;  % convert to radians
        if beta == 0
            d1 = mn * z1;  % Spur gear: module is transverse module
        else
            d1 = mn * z1 / cos(beta);  % Helical gear: assuming normal module (standard)
        end
        u = z2 / z1;

        % Use Ftcount function to compute Ft and v (matches reference code)
        chilun = struct();
        chilun.mn = mn;
        chilun.z1 = z1;
        chilun.B = beta_deg;  % degrees
        chilun.nw = n;         % rpm
        chilun.p = P_kW;       % kW
        chilun.d1 = d1;        % mm (pre-computed)
        
        [Ft, v] = Ftcount(chilun);  % Ft in N, v in m/s

        % Get dimensionless factors (existing helper functions)
        i = str2double(handles.bg_yuan.SelectedObject.Tag);
        j = str2double(handles.bg_gong.SelectedObject.Tag);
        KA = getKA(i, j);
        KV = getKV(v, handles.edit_jd.Value);
        KHa = getKHa(b / d1);  % ratio is dimensionless
        KHb = getKHb(b, d1, handles.edit_jd.Value);
        Zh = getZh(beta, z1, z2);
        Zab = getZab(beta, z1, z2, mn, b);  % Pass face width b for proper epsilon_beta

        % Elastic coefficient Ze (MPa^0.5) - computed from material properties
        % For steel-steel: E ≈ 210000 MPa, ν ≈ 0.30 → Ze ≈ 340 MPa^0.5
        % Use default steel-steel properties (can be extended for other materials)
        Ze = computeZe([], []);  % Returns ~340 for steel-steel

        % Determine if internal or external meshing
        isInternal = strcmp(handles.bg_chihe.SelectedObject.Tag, 'internal');

        % ---------- DIAGNOSTIC PRINTS ----------
        fprintf('---- DIAGNOSTIC ----\n');
        fprintf('Inputs: mn=%.6g, z1=%.6g, z2=%.6g, b(mm)=%.6g, P_kW=%.6g, n(rpm)=%.6g, beta(deg)=%.6g, jd=%g\n', ...
            mn, z1, z2, b, P_kW, n, handles.edit_beta.Value, handles.edit_jd.Value);

        fprintf('d1 (mm) = %.6g\n', d1);
        fprintf('d1 (m) = %.6g\n', d1/1000);
        fprintf('u = z2/z1 = %.6g\n', u);

        fprintf('Ft (N) = %.6g\n', Ft);
        fprintf('v (m/s) = %.6g\n', v);

        % factors
        fprintf('KA = %.6g, KV = %.6g, KHa = %.6g, KHb = %.6g\n', KA, KV, KHa, KHb);
        fprintf('Ze = %.6g, Zh = %.6g, Zab = %.6g\n', Ze, Zh, Zab);
        
        % Additional diagnostic for contact ratio (if available from getZab)
        % Note: epsilon values are computed inside getZab, but we can recompute for display
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

        % branch and factor inside sqrt
        if isInternal
            fprintf('Branch: INTERNAL (use (u-1)/u)\n');
            % compute the inside-of-sqrt exactly as in the formula
            X = Ft * (u-1) / (b * d1 * u) * KA * KV * KHa * KHb;
        else
            fprintf('Branch: EXTERNAL (use (u+1)/u)\n');
            % compute the inside-of-sqrt exactly as in the formula
            X = Ft / b / d1 * (u+1) / u * KA * KV * KHa * KHb;
        end
        fprintf('Inside sqrt X = %.12g\n', X);
        fprintf('sqrt(X) = %.12g\n', sqrt(X));
        fprintf('sigmaH = Ze * Zh * Zab * sqrt(X) = %.12g MPa\n', Ze * Zh * Zab * sqrt(X));

        % Compare to your reported value
        fprintf('reported handles.text_result_H = %s\n', handles.text_result_H.Value);
        fprintf('---------------------\n');

        % Compute contact stress using reference formula exactly
        % Units: Ft[N], b[mm], d1[mm] → Ft/(b*d1) = N/mm² = MPa directly
        if isInternal
            % Internal meshing: H = Ze * Zh * Zab * sqrt(Ft*(u-1)/(b*d1*u) * KA*KV*KHa*KHb)
            sigmaH = Ze * Zh * Zab * sqrt(Ft * (u-1) / (b * d1 * u) * KA * KV * KHa * KHb);
        else
            % External meshing: H = Ze * Zh * Zab * sqrt(Ft/b/d1 * (u+1)/u * KA*KV*KHa*KHb)
            sigmaH = Ze * Zh * Zab * sqrt(Ft / b / d1 * (u+1) / u * KA * KV * KHa * KHb);
        end
        % Result is already in MPa (since Ft[N]/(b[mm]*d1[mm]) = N/mm² = MPa)

        handles.text_result_H.Value = sprintf('%.4f', sigmaH);

        % Optional: comparison with allowable if present
        if ~isempty(handles.text_result_HP.Value) && ~strcmp(handles.text_result_HP.Value, '')
            HP = str2double(handles.text_result_HP.Value);
            if sigmaH <= HP
                % Pass
            else
                % Fail
            end
        end
        
    catch ME
        uialert(fig, ME.message, '计算错误');
    end
end

function calculateAllowableStress(btn, event)
    % Calculate allowable contact stress [σH] according to GB/ISO standards
    %
    % Radio button mappings (mechanical states):
    %   bg_kekao: Reliability (0.85, 0.90, 0.95, 0.99) → affects ZR (reliability factor)
    %   bg_luoxuan: 'straight'/'helical' → affects β for velocity calculation
    %   edit_yingLi: Stress cycle number N → affects ZNT (life factor)
    %   edit_m: Module → affects ZX (size factor)
    %   edit_speed: Speed → affects ZW (velocity factor)
    %
    try
        % Find the figure
        fig = btn.Parent;
        while ~isempty(fig) && ~isa(fig, 'matlab.ui.Figure')
            fig = fig.Parent;
        end
        if isempty(fig)
            error('Could not find figure handle');
        end
        handles = fig.UserData;

        % Life cycles
        N = handles.edit_yingLi.Value;
        
        % Material limits Hlim (in MPa)
        Hlim1 = handles.edit_hlim1.Value;
        Hlim2 = handles.edit_hlim2.Value;
        
        % Reliability factor — convert reliability tag to ZR (reliability reduction factor)
        % ZR should be ≤ 1.0 and reduces allowable stress for higher reliability requirements
        reliabilityTag = str2double(handles.bg_kekao.SelectedObject.Tag);
        % Standard mapping: 50%→1.00, 90%→0.90, 95%→0.85, 99%→0.80
        if reliabilityTag >= 0.99
            ZR = 0.80;  % High reliability (99%+) - reduces allowable stress by 20%
        elseif reliabilityTag >= 0.95
            ZR = 0.85;  % Higher reliability (95-99%) - reduces by 15%
        elseif reliabilityTag >= 0.90
            ZR = 0.90;  % General reliability (90-95%) - reduces by 10%
        else
            ZR = 1.00;  % Low reliability (<90%) - no reduction
        end

        % Safety factor SF (typically 1.0-1.5 for contact stress)
        % Using standard value of 1.0 (can be adjusted based on application requirements)
        SF = 1.0;

        % Life factor and other dimensionless factors
        ZNT = getZNT(N);
        ZLVR = 1.0;  % Lubrication/life factor (simplified)

        % Velocity factor ZW - calculate velocity consistently
        mn = handles.edit_m.Value;
        z1 = handles.edit_z1.Value;
        beta_deg = handles.edit_beta.Value;
        beta = beta_deg * pi/180;
        % Use same d1 calculation as in calculateContactStress
        if beta == 0
            d1_mm = mn * z1;  % Spur gear
        else
            d1_mm = mn * z1 / cos(beta);  % Helical gear (normal module)
        end
        v = pi * d1_mm * handles.edit_speed.Value / 60000;  % Linear velocity in m/s
        ZW = getZW(v);
        
        % Size factor ZX
        ZX = getZX(mn);
        
        % Calculate allowable contact stress [σH] (MPa)
        % Formula: [σH] = σHlim × ZNT × ZLV × ZW × ZX × ZR / SF
        % Where: ZR is reliability reduction factor (multiplies, <1.0 for high reliability)
        %        SF is safety factor (divides, typically 1.0-1.5)
        HP1 = Hlim1 * ZNT * ZLVR * ZW * ZX * ZR / SF;
        HP2 = Hlim2 * ZNT * ZLVR * ZW * ZX * ZR / SF;

        % ---------- DIAGNOSTIC PRINTS FOR ALLOWABLE STRESS ----------
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

        % Use the smaller value (conservative approach)
        HP = min(HP1, HP2);
        
        handles.text_result_HP.Value = sprintf('%.4f', HP);

        % Optional: compare to current contact stress if available
        if ~isempty(handles.text_result_H.Value) && ~strcmp(handles.text_result_H.Value, '')
            sigmaH = str2double(handles.text_result_H.Value);  % MPa
            if sigmaH <= HP
                % Pass
            else
                % Fail
            end
        end
        
    catch ME
        uialert(fig, ME.message, '计算错误');
    end
end


function updateMaterial1(src, event)
    % Update material properties for small gear based on selection
    % Get handles from figure - navigate up: uibuttongroup -> xiaochiPanel -> materialPanel -> rightPanel -> fig
    fig = src.Parent.Parent.Parent.Parent;
    handles = fig.UserData;
    
    % Check if a selection was made
    if isempty(src.SelectedObject)
        return;
    end
    
    materialTag = event.NewValue.Tag;
    [hbs, ~] = getMaterialProperties(materialTag);  % Get base HBS
    
    % Get heat treatment selection (if available)
    heatTreatment = 'none';  % Default
    if isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % Calculate Hlim with heat treatment consideration
    hlim = getHlimFromCategory(materialTag, hbs, heatTreatment);
    
    handles.edit_hbs1.Value = hbs;
    handles.edit_hlim1.Value = hlim;
end

function updateMaterial2(src, event)
    % Update material properties for large gear based on selection
    % Get handles from figure - navigate up: uibuttongroup -> dachiPanel -> materialPanel -> rightPanel -> fig
    fig = src.Parent.Parent.Parent.Parent;
    handles = fig.UserData;
    
    % Check if a selection was made
    if isempty(src.SelectedObject)
        return;
    end
    
    materialTag = event.NewValue.Tag;
    [hbs, ~] = getMaterialProperties(materialTag);  % Get base HBS
    
    % Get heat treatment selection (if available)
    heatTreatment = 'none';  % Default
    if isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % Calculate Hlim with heat treatment consideration
    hlim = getHlimFromCategory(materialTag, hbs, heatTreatment);
    
    handles.edit_hbs2.Value = hbs;
    handles.edit_hlim2.Value = hlim;
end

function [hbs, hlim] = getMaterialProperties(materialTag)
    % Material property database
    % Returns [HBS hardness, Hlim contact fatigue limit in MPa]
    
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
        % Default values
        hbs = 250;
        hlim = 600;
    end
end


function customMaterialDialog(btn, event)
    % Custom material input dialog with material selection
    % btn is expected to be a uicontrol/uibutton that lives in a figure.
    %
    % This version is robust: it won't error if fig.UserData or
    % handles.edit_hbs1 is missing. It supplies a safe default value.

    % --- find the top-level figure that contains the button (robust) ---
    fig = [];
    try
        parentObj = btn;
        % climb up the Parent chain until we hit a matlab.ui.Figure
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
        % fallback empty
        fig = [];
    end

    % Try to read handles from the figure UserData if present
    handles = [];
    if ~isempty(fig) && isprop(fig,'UserData')
        try
            handles = fig.UserData;
        catch
            handles = [];
        end
    end

    % --- create the dialog figure ---
    % Larger dialog height so bottom controls are visible
    d = uifigure('Name', 'zidingyi', 'Position', [400 300 450 450]);

    % Main panel: 齿轮材料 (top)
    mainPanel = uipanel(d, 'Position', [20 230 410 200], 'Title', '齿轮材料');

    % Small gear sub-panel (col1)
    xiaochiSubPanel = uipanel(mainPanel, 'Position', [10 10 180 160], 'Title', '小齿轮');
    bg_xiaochi_custom = uibuttongroup(xiaochiSubPanel, 'Position', [5 5 170 130], 'BorderType', 'none');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 110 80 18], 'Text', '钢', 'Tag', 'steel_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 90 80 18], 'Text', '铸钢', 'Tag', 'caststeel_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 70 80 18], 'Text', '球墨铸铁', 'Tag', 'ductile_small');
    uiradiobutton(bg_xiaochi_custom, 'Position', [5 50 80 18], 'Text', '铸铁', 'Tag', 'cast_small');

    % Large gear sub-panel (col2)
    dachiSubPanel = uipanel(mainPanel, 'Position', [200 10 200 160], 'Title', '大齿轮');
    bg_dachi_custom = uibuttongroup(dachiSubPanel, 'Position', [5 5 190 130], 'BorderType', 'none');
    uiradiobutton(bg_dachi_custom, 'Position', [5 110 90 18], 'Text', '钢', 'Tag', 'steel_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 90 90 18], 'Text', '铸钢', 'Tag', 'caststeel_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 70 90 18], 'Text', '球墨铸铁', 'Tag', 'ductile_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 50 90 18], 'Text', '铸铁', 'Tag', 'cast_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 30 90 18], 'Text', '锡青铜', 'Tag', 'bronze_large');
    uiradiobutton(bg_dachi_custom, 'Position', [5 10 90 18], 'Text', '织物层压塑料', 'Tag', 'plastic_large');

    % Single Hardness HBS input field (below main panel, on the left)
    uilabel(d, 'Position', [20 180 60 22], 'Text', '硬度HBS', 'Visible', 'on');

    % Safely obtain a default value for the edit field from handles if available.
    defaultHBS = [];
    if ~isempty(handles)
        try
            if isfield(handles, 'edit_hbs1')
                % handles.edit_hbs1 may be a uieditfield or numeric - guard both cases
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
        defaultHBS = 0; % safe fallback
    end

    % Create the numeric edit field (this will not error now)
    edit_hbs_custom = uieditfield(d, 'numeric', ...
        'Position', [90 180 100 22], ...
        'Value', defaultHBS, ...
        'Visible', 'on');

    % Return button (on the right side, aligned horizontally)
    uibutton(d, ...
        'Position', [300 175 110 35], ...
        'Text', '返回', ...
        'Visible', 'on', ...
        'ButtonPushedFcn', @(btn2,event2) updateCustomMaterialFromDialog(fig, bg_xiaochi_custom, bg_dachi_custom, ...
        edit_hbs_custom, d));
end


function updateCustomMaterialFromDialog(fig, bg_xiaochi_custom, bg_dachi_custom, edit_hbs_custom, dialog)
    % Safely get handles from figure if available
    handles = [];
    if ~isempty(fig) && isprop(fig,'UserData')
        try
            handles = fig.UserData;
        catch
            handles = [];
        end
    end
    
    % Get single HBS value (used for both gears)
    hbs = edit_hbs_custom.Value;
    
    % Get heat treatment selection (if available)
    heatTreatment = 'none';  % Default
    if ~isempty(handles) && isfield(handles, 'bg_rechuli') && ~isempty(handles.bg_rechuli.SelectedObject)
        heatTreatment = handles.bg_rechuli.SelectedObject.Tag;
    end
    
    % Get selected material types and calculate Hlim with heat treatment
    if ~isempty(bg_xiaochi_custom.SelectedObject)
        material1_tag = bg_xiaochi_custom.SelectedObject.Tag;
        hlim1 = getHlimFromCategory(material1_tag, hbs, heatTreatment);
    else
        % Default if no selection
        hlim1 = 600;
    end
    
    if ~isempty(bg_dachi_custom.SelectedObject)
        material2_tag = bg_dachi_custom.SelectedObject.Tag;
        hlim2 = getHlimFromCategory(material2_tag, hbs, heatTreatment);
    else
        % Default if no selection
        hlim2 = 600;
    end
    
    % Update main GUI - use same HBS for both gears (only if handles exist)
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
            % Silently fail if update is not possible
        end
    end
    
    close(dialog);
end

function hlim = getHlimFromCategory(materialTag, hbs, heatTreatment)
    % Calculate Hlim based on material category, HBS hardness, and heat treatment
    % Material categories: steel, carburized, ductile, cast, caststeel, bronze, plastic
    % Heat treatment: 'none', 'quench', 'normalize', 'anneal', 'carburize', 'surface', 'nitride'
    
    % Default heat treatment if not provided
    if nargin < 3 || isempty(heatTreatment)
        heatTreatment = 'none';
    end
    
    % Base Hlim calculation from material and HBS
    if contains(materialTag, 'steel') || contains(materialTag, 'carburized')
        % Steel and carburized steel: base Hlim ≈ 2.5 * HBS + 100
        base_hlim = 2.5 * hbs + 100;
        base_hlim = max(base_hlim, 500); % Minimum
        base_hlim = min(base_hlim, 1200); % Maximum
    elseif contains(materialTag, 'ductile')
        % Ductile iron: Hlim ≈ 2.0 * HBS + 150
        base_hlim = 2.0 * hbs + 150;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 800);
    elseif contains(materialTag, 'cast') && ~contains(materialTag, 'caststeel')
        % Cast iron: Hlim ≈ 1.8 * HBS + 100
        base_hlim = 1.8 * hbs + 100;
        base_hlim = max(base_hlim, 400);
        base_hlim = min(base_hlim, 700);
    elseif contains(materialTag, 'caststeel')
        % Cast steel: Hlim ≈ 2.2 * HBS + 120
        base_hlim = 2.2 * hbs + 120;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 900);
    elseif contains(materialTag, 'bronze')
        % Tin bronze: Hlim ≈ 1.5 * HBS + 50
        base_hlim = 1.5 * hbs + 50;
        base_hlim = max(base_hlim, 200);
        base_hlim = min(base_hlim, 400);
    elseif contains(materialTag, 'plastic')
        % Fabric laminated plastic: Hlim ≈ 0.8 * HBS + 50
        base_hlim = 0.8 * hbs + 50;
        base_hlim = max(base_hlim, 100);
        base_hlim = min(base_hlim, 250);
    else
        % Default (steel-like)
        base_hlim = 2.0 * hbs + 100;
        base_hlim = max(base_hlim, 500);
        base_hlim = min(base_hlim, 1000);
    end
    
    % Apply heat treatment multiplier to base Hlim
    % Heat treatment significantly affects contact fatigue strength
    switch heatTreatment
        case 'carburize'
            % 渗碳淬火: significantly increases Hlim (typically 1.2-1.3x)
            hlim = base_hlim * 1.25;
        case 'surface'
            % 表面淬火: increases Hlim (typically 1.15-1.2x)
            hlim = base_hlim * 1.18;
        case 'nitride'
            % 氮化: increases Hlim (typically 1.1-1.15x)
            hlim = base_hlim * 1.12;
        case 'quench'
            % 调质: moderate increase (typically 1.05-1.1x)
            hlim = base_hlim * 1.08;
        case 'normalize'
            % 正火: slight increase (typically 1.02-1.05x)
            hlim = base_hlim * 1.03;
        case 'anneal'
            % 退火: slight decrease or no change (typically 0.98-1.0x)
            hlim = base_hlim * 0.99;
        case 'none'
            % 无: no change
            hlim = base_hlim;
        otherwise
            % Unknown treatment: use base value
            hlim = base_hlim;
    end
    
    % Final clamp to reasonable range
    hlim = max(hlim, 200);
    hlim = min(hlim, 1500);
end

% Helper functions for coefficient calculations

function Ze = computeZe(material1, material2)
    % Compute elastic coefficient Ze from material properties
    % Input: material1, material2 are structs or tags (currently unused, using defaults)
    % Output: Ze in MPa^0.5
    % 
    % For steel-steel: E ≈ 210000 MPa, ν ≈ 0.30 → Ze ≈ 340 MPa^0.5
    % Formula: Ze = sqrt(1 / ((1-ν1²)/E1 + (1-ν2²)/E2))
    
    % Default mechanical properties for steel-steel (MPa)
    E1 = 210000;  % Young's modulus (MPa)
    nu1 = 0.30;   % Poisson's ratio
    E2 = 210000;  % Young's modulus (MPa)
    nu2 = 0.30;   % Poisson's ratio
    
    % TODO: If you have material-specific E, nu, pick them here based on material tags:
    % if isfield(material1,'E'), E1 = material1.E; end
    % if isfield(material1,'nu'), nu1 = material1.nu; end
    % similarly for material2...
    
    % Compute Ze per ISO-style elastic coefficient formula
    den = (1 - nu1^2)/E1 + (1 - nu2^2)/E2;
    Ze = sqrt(1 / den);  % gives ~340 MPa^0.5 for steel-steel
end

function [Ft, v] = Ftcount(chilun)
    % Calculate tangential force Ft (N) and linear velocity v (m/s)
    % Matches reference code implementation with proper unit handling
    % Input: chilun struct with fields:
    %   - mn: module (mm)
    %   - z1: pinion teeth
    %   - B: helix angle (degrees), or beta in radians
    %   - nw: rotational speed (rpm)
    %   - p: power (kW)
    %   - d1: pitch diameter (mm) - optional, will compute if not provided
    %
    % Output:
    %   - Ft: tangential force (N)
    %   - v: linear velocity (m/s)
    
    PI = pi;
    
    % Get d1 in mm (use provided or compute from module and teeth)
    if isfield(chilun, 'd1') && ~isempty(chilun.d1)
        d1 = chilun.d1;  % mm (already computed)
    else
        % Compute d1 from module and teeth
        if isfield(chilun, 'B') && chilun.B ~= 0
            beta = chilun.B * PI / 180;  % convert degrees to radians
            d1 = chilun.mn * chilun.z1 / cos(beta);  % mm (helical gear)
        else
            d1 = chilun.mn * chilun.z1;  % mm (spur gear)
        end
    end
    
    n = chilun.nw;        % rpm
    P_kW = chilun.p;      % kW
    
    % Convert d1 from mm to m for torque calculation
    d1_m = d1 / 1000;  % m
    
    % Angular speed (rad/s)
    omega = 2 * PI * n / 60;  % rad/s
    
    % Torque (N·m)
    P_W = P_kW * 1000;  % W
    T = P_W / omega;    % N·m
    
    % Tangential force Ft (N)
    Ft = 2 * T / d1_m;
    % Equivalent form: Ft = 60000 * P_kW / (PI * n * d1_m);
    
    % Linear pitch line velocity v (m/s)
    % v = π * d1(mm) * n(rpm) / 60000 = m/s
    v = PI * d1 * n / 60000;  % m/s
end

function KA = getKA(i, j)
    % Application factor based on prime mover and driven machine
    ka = [1.00 1.25 1.50 1.75;
          1.10 1.35 1.60 1.85;
          1.25 1.50 1.75 2.00;
          1.50 1.75 2.00 2.25];
    KA = ka(i, j);
end

function KV = getKV(v, grade)
    % Dynamic load factor (simplified)
    % v: velocity in m/s, grade: accuracy grade
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
    % Face load distribution factor
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
    % Transverse load distribution factor
    psi_d = b / d1;
    base = 1.0 + 0.15 * psi_d + 0.02 * (10 - grade);
    KHb = max(1.0, min(base, 2.0));
end

function Zh = getZh(beta, z1, z2)
    % Zone factor (节点区域系数)
    % Improved approximation based on mean tooth count and helix angle
    % Zh typically ranges from 1.9 to 2.9, decreasing with more teeth
    
    Zm = (z1 + z2) / 2;  % Mean number of teeth
    
    % Baseline Zh (for spur or reference)
    Zh0 = 2.7 - 0.01 * Zm;
    
    % Helix angle correction (helical gears have slightly different Zh)
    if beta == 0
        Zh = Zh0;  % Spur gear
    else
        % Helical gear: slight adjustment based on helix angle
        Zh = Zh0 * (1 + 0.02 * abs(sin(beta)));
    end
    
    % Clamp to reasonable range
    Zh = max(1.9, min(Zh, 2.9));
end

function Zab = getZab(beta, z1, z2, mn, b)
    % Contact ratio factor (重合度系数)
    % Computes Zab based on total contact ratio epsilon = epsilon_alpha + epsilon_beta
    % Input: beta (radians), z1, z2, mn (normal module in mm), b (face width in mm)
    
    % Transverse pressure angle
    alpha_n = 20 * pi/180;  % Normal pressure angle (standard)
    if beta == 0
        alpha_t = alpha_n;  % Spur gear
    else
        alpha_t = atan(tan(alpha_n) / cos(beta));  % Transverse pressure angle
    end
    
    % Transverse contact ratio epsilon_alpha (baseline approximation)
    % For standard full-depth teeth, this is typically 1.6-2.0
    epsilon_alpha = 1.6 + 0.001 * (z1 + z2);  % Conservative baseline
    
    % Axial contact ratio epsilon_beta (helical contribution)
    if beta == 0
        epsilon_beta = 0;  % No axial overlap for spur gears
    else
        % Axial overlap: epsilon_beta = (b * tan(beta)) / (π * mn)
        % This is the engineering approximation for axial contact ratio
        epsilon_beta = (b / mn) * abs(tan(beta)) / pi;
    end
    
    % Total contact ratio
    epsilon = epsilon_alpha + epsilon_beta;
    
    % Map contact ratio epsilon to Zab factor
    % Zab typically ranges from 0.6 to 1.0, increasing with epsilon
    % Mapping: epsilon ~1.0 → Zab ~0.6, epsilon ~2.5 → Zab ~1.0
    if epsilon <= 1.0
        Zab = 0.6;
    elseif epsilon >= 2.5
        Zab = 1.0;
    else
        % Linear interpolation between epsilon 1.0 and 2.5
        Zab = 0.5 + 0.35 * ((epsilon - 1.0) / 1.5);
    end
    
    % Clamp to standard range
    Zab = max(0.6, min(Zab, 1.1));
end

function ZNT = getZNT(N)
    % Life factor
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
    % Velocity factor
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
    % Size factor
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
    % Reliability reduction factor (ZR) according to GB/ISO standards
    % Higher reliability → lower ZR → lower allowable stress
    % This is a multiplicative factor (<1.0) that reduces allowable stress
    % Standard mapping from GB1356-88 / ISO 6336-2:
    %   50% reliability → ZR = 1.00
    %   90% reliability → ZR = 0.90
    %   95% reliability → ZR = 0.85
    %   99% reliability → ZR = 0.80
    
    if reliability >= 0.99
        ZR = 0.80; % High reliability (99%+) - reduces allowable stress by 20%
    elseif reliability >= 0.95
        ZR = 0.85; % Higher reliability (95-99%) - reduces by 15%
    elseif reliability >= 0.90
        ZR = 0.90; % General reliability (90-95%) - reduces by 10%
    else
        ZR = 1.00; % Low reliability (<90%) - no reduction
    end
end