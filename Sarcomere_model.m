%Step 1: Initialize Constants & Input Vector (Physical dimensions of filaments)%
Myosin_Length=1.60;
Actin_Length=1.00;
Central_Bare_Zone=0.15;
Optimal_Length_Range_Min=2.00;
Optimal_Length_Range_Max=2.25;

L_Sarcomere=linspace(1.00,4.00,500);

%step 2: Active Force Piecewise Function (The 5 physical sliding zones of filaments)% 
F_Active=zeros(size(L_Sarcomere));
for i = 1:length(L_Sarcomere)
    L=L_Sarcomere(i);
    if L < 1.27
        %Extreme Collision filaments crash into z-disc (a dark,
        %protein-rich structural boundary that separates adjacent sarcomeres in striated and cardiac muscle cells.
        %It acts as the anchor point for thin actin filaments and helps transmit the physical force generated during muscle contraction.)
        %Minimized cross-bridge formation due to no space to bind myosin and actin filaments
        F_Active(i)=0;
    elseif 1.27 < L && L < 1.67
            %Ascending limb 1 - Thick filament presses against Z-discs,
            %filaments are compressed against each other significantly jamming sarcomere and impacting force potential.
            F_Active(i)= ((L-1.27)/(1.67-1.27))*0.70;
    elseif 1.67 < L && L < Optimal_Length_Range_Min
            %Ascending Limb 2 - actin filaments double-overlap in the center, 
            %interference between overlapping filaments reduces overall force potential,
            %but because there is more space between filaments there is still more force potential than previous two levels.
            %The spacing allows some cross-bridges to form between myosin heads and actin filaments
            F_Active(i)= 0.70+0.30*((L-1.67)/(Optimal_Length_Range_Min-1.67));
    elseif Optimal_Length_Range_Min < L && L < Optimal_Length_Range_Max
            %Optimal Plateau - Maximum cross-bridge binding, perfect
            %spacing between filaments allows myosin heads to bond with actin filaments,
            %creating cross-bridges, which release stored energy from ADP and phosphate,
            %pulling in the actin filament, forcibly shortening muscle fiber to cause contraction. 
            %A new ATP molecule binds to the myosin head, 
            %breaking the bridge and resetting the myosin head to form another bridge
            F_Active(i)= 1.0;
    elseif Optimal_Length_Range_Max < L && L < 3.65
            %Descending Limb - Filaments pull apart and myosin heads start becoming unable to reach the actin filaments to form cross-bridges
            F_Active(i)= 1.0 - ((L-Optimal_Length_Range_Max)/(3.65-Optimal_Length_Range_Max));
    else
        %Zero Overlap - Almost or no cross-bridges form because most if not all myosin and actin filaments are too far apart from each other to bind.
        F_Active(i)=0;
    end
end 

%Step 3: Passive Force Calculation (Titin exponential spring model)%
%Titin is a protein that acts like a molecular spring.
%It's responsible for muscle elasticity and making muscles snap back after stretching as well as keeping muscle fibers organized.

F_Passive = zeros(size(L_Sarcomere));
K_Passive = 3.5;

for i = 1:length(L_Sarcomere)
    L=L_Sarcomere(i);
    if L > Optimal_Length_Range_Max
        Strain = (L - Optimal_Length_Range_Max) / Optimal_Length_Range_Max;
        F_Passive(i) = 0.05 * (exp(K_Passive * Strain) - 1);
    else
        F_Passive(i) = 0.0;
    end
end

%Step 4:Total Force & Data Aggregation%
%Combining the active force of stretching between cross bridges of filaments with the passive pulling force of the titin.
F_Total = F_Active + F_Passive;

%Step 5: Visualization & Figure Exporting (Plot formatting, shading, and labels)%
figure
hold on
plot(L_Sarcomere,F_Active,'r-')
plot(L_Sarcomere,F_Passive,'g--')
plot(L_Sarcomere,F_Total,'b-')
xlabel("Sarcomere Length (\mum)")
ylabel("Normalized Force (F / F_0)")
title('Force-Length Relationship in Sarcomeres');
legend('Active Force', 'Passive Force', 'Total Force');
grid on;
hold off;