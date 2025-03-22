fprintf('Greetings! \nWelcome to Roll with It \n')
while 1
    intro=input('\nIf you would like to see the rules, type 1. If not, type 0.');
    if intro==1
        fprintf('\nThe goal of the game is to acheive the highest score possible. \nYou will choose how many rounds you play. \nIn each round, you will roll 3 dice. \nAfter the roll, you can hold certain dice, meaning they will not be rolled again. \nYou will roll unheld dice one more time. \nAfter the second roll, you will choose how your score is saved. \n\nYou can choose: \n1.) Chance: Sum of dice - Bonus: 0 Points \n2.) Two-of-a-kind: Two dice match - Bonus: 1 Point \n3.) Straight: Dice are in order (1-2-3, 2-1-3, etc.) - Bonus: 2 Points \n4.) Three-of-a-kind: All dice match - Bonus: 3 Points \n\nYour score for each turn is the sum of the dice plus the bonus. \nOnce a certain option is used, it can not be used again in future rounds. \nWhen the round ends you repeat the process, building upon your score. \n')
        break
    elseif intro==0
        break
    else
        fprintf('\nInvalid entry. Please try again. \n')
    end
end
while 1
    rounds=input('\nHow many rounds do you want to play? Choose from 1 to 4.');
    if rounds==1||rounds==2||rounds==3||rounds==4
        break
    else
        fprintf('\nInvalid entry. Please try again. \n')
    end
end
while 1
    color=input('\nSelect a color for the dice. Type 1 for red, 2 for blue, or 3 to randomize.');
    if color==1
        color=[1 0 0];
        break
    elseif color==2
        color=[0 0 1];
        break
    elseif color==3
        color=[rand rand rand];
        break
    else
        fprintf('\nInvalid entry. Please try again. \n')
    end
end
score=0;
o1=0;
o2=0;
o3=0;
o4=0;
for n=1:rounds
    fprintf('\nNow starting round %i! \n',n)
    b=0;
    d1=0;
    d2=0;
    d3=0;
    k=zeros(1,3);
    for rr=1:2
        for t=1:15
            if d1==0
                die1=randi(3);
            end
            if d2==0
                die2=randi(3);
            end
            if d3==0
                die3=randi(3);
            end
            hold on
            xlim([0 5])
            ylim([0 2])
            plot([0.5 0.5 1.5 1.5 0.5],[0.5 1.5 1.5 0.5 0.5],'k','LineWidth',1.75)
            plot([2 2 3 3 2],[0.5 1.5 1.5 0.5 0.5],'k','LineWidth',1.75)
            plot([3.5 3.5 4.5 4.5 3.5],[0.5 1.5 1.5 0.5 0.5],'k','LineWidth',1.75)
            if die1==1
                plot(1,1,'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die1==2
                plot([0.75,1.25],[1.25,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die1==3
                plot([0.75,1,1.25],[1.25,1,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            end
            if die2==1
                plot(2.5,1,'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die2==2
                plot([2.25,2.75],[1.25,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die2==3
                plot([2.25,2.5,2.75],[1.25,1,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            end
            if die3==1
                plot(4,1,'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die3==2
                plot([3.75,4.25],[1.25,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            elseif die3==3
                plot([3.75,4,4.25],[1.25,1,0.75],'o','MarkerFaceColor',color,'MarkerSize',25)
            end
            pause(0.1)
            if t<15
                clf
            end
        end
        fprintf('\nDone rolling! \n')
        if b==0
            while 1
                k(1)=input('\nWhat is the first die you want to keep? Type 0 to keep none and roll all dice again.');
                if k(1)==0||k(1)==1||k(1)==2||k(1)==3
                    break
                else
                    fprintf('\nInvalid entry, please try again. \n')
                end
            end
            while 1
                if k(1)==0
                    break
                end
                k(2)=input('\nWhat is the second die you want to keep? Type 0 to roll remaining die.');
                if k(2)==k(1)
                    fprintf('\nAlready stored, please enter a different value. \n')
                elseif k(2)==0||k(2)==1||k(2)==2||k(2)==3
                    break
                else
                    fprintf('\nInvalid entry, please try again. \n')
                end
            end
            while 1
                if k(2)==0
                    break
                end
                k(3)=input('\nWhat is the third die you want to keep? Type 0 to roll remaining die.');
                if k(3)==k(1)||k(3)==k(2)
                    fprintf('\nAlready stored, please enter a different value. \n')
                elseif k(3)==0||k(3)==1||k(3)==2||k(3)==3
                    break
                else
                    fprintf('\nInvalid entry, please try again. \n')
                end
            end
            for hh=1:length(k)
                if k(hh)==1
                    d1=1;
                elseif k(hh)==2
                    d2=1;
                elseif k(hh)==3
                    d3=1;
                end
            end
        end
        b=1;
    end
    if o1==0
        fprintf('\nOption 1: Chance! Sum of dice = %i. Bonus = 0. Total of %i added to your current score of %i points!',die1+die2+die3,die1+die2+die3,score)
    else
        fprintf('\nOption 1: Chance no longer available.')
    end
    if o2==0 && ((die1==die2 && die1~=die3)||(die2==die3 && die2~=die1)||(die1==die3 && die1~=die2))
        fprintf('\nOption 2: Two-of-a-kind! Sum of dice = %i. Bonus = 1. Total of %i added to your current score of %i points!',die1+die2+die3,die1+die2+die3+1,score)
    elseif o2==1
        fprintf('\nOption 2: Two-of-a-kind no longer available.')
    else
        fprintf('\nOption 2: No two-of-a-kind. If selected, you add 0 points to your current score of %i.',score)
    end
    if o3==0 && ((die1~=die2)&&(die2~=die3)&&(die1~=die3))
        fprintf('\nOption 3: Straight! Sum of dice = %i. Bonus = 2. Total of %i added to your current score of %i points!',die1+die2+die3,die1+die2+die3+2,score)
    elseif o3==1
        fprintf('\nOption 3: Straight no longer available.')
    else
        fprintf('\nOption 3: No straight. If selected, you add 0 points to your current score of %i.',score)
    end
    if o4==0 && ((die1==die2)&&(die2==die3))
        fprintf('\nOption 4: Three-of-a-kind! Sum of dice = %i. Bonus = 3. Total of %i added to your current score %i points! \n',die1+die2+die3,die1+die2+die3+3,score)
    elseif o4==1
        fprintf('\nOption 4: Three-of-a-kind no longer available.')
    else
        fprintf('\nOption 4: No three-of-a-kind. If selected, you add 0 points to your current score of %i. \n',score)
    end
    while 1
        option=input('\nWhat option do you want to pick?');
        if (option==1 && o1==0)||(option==2 && o2==0)||(option==3 && o3==0)||(option==4 && o4==0)
            break
        elseif (option==1 && o1==1)||(option==2 && o2==1)||(option==3 && o3==1)||(option==4 && o4==1)
            fprintf('\nAlready used, please try again. \n')
        else
            fprintf('\nInvalid entry, please try again. \n')
        end
    end
    if option==1 && o1==0
        o1=1;
        score=score+die1+die2+die3;
    elseif option==2 && o2==0 && ((die1==die2 && die1~=die3)||(die2==die3 && die2~=die1)||(die1==die3 && die1~=die2))
        o2=1;
        score=score+die1+die2+die3+1;
    elseif option==3 && o3==0 && ((die1~=die2)&&(die2~=die3)&&(die1~=die3))
        o3=1;
        score=score+die1+die2+die3+2;
    elseif option==4 && o4==0 && ((die1==die2)&&(die2==die3))
        o4=1;
        score=score+die1+die2+die3+3;
    end
    fprintf('\nYour current score is %i points. \n',score)
end
fprintf('\nCongratulations, you scored %i points!',score)