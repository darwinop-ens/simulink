function consts = darwinop_consts_fr

consts.mx28_fields = {};
consts.mx28_fields = add_field(consts.mx28_fields,0,2,'Modèle','Numéro de modèle','AR');
consts.mx28_fields = add_field(consts.mx28_fields,2,1,'Version','Information de version','AR');
consts.mx28_fields = add_field(consts.mx28_fields,3,1,'ID','ID du MX28 sur le bus Dynamixel','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,4,1,'Débit binaire','Débit binaire du bus Dynamixel','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,5,1,'Temps de retour','Temps de retour','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,6,2,'Limite horaire','Limite angulaire dans le sens horaire','RW');
consts.mx28_fields = add_field(consts.mx28_fields,8,2,'Limite anti-horaire','Limite angulaire dans le sens anti-horaire','RW');
consts.mx28_fields = add_field(consts.mx28_fields,11,1,'Température maximale','Limite maximale de température','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,12,1,'Tension minimale','Limite minimale de tension d''alimentation','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,13,1,'Tension maximale','Limite maximale de tension d''alimentation','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,14,2,'Couple maximal','Limite maximale de couple','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,16,1,'Retour de statut','Configuration du retour automatique de statut','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,17,1,'LED d''alarme','Configuration de la LED d''alarme','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,18,1,'Mot d''erreur','Mot d''erreur','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,24,1,'Activation du couple','Activation du couple','RW');
consts.mx28_fields = add_field(consts.mx28_fields,25,1,'LED','Allumage de la LED','RW');
consts.mx28_fields = add_field(consts.mx28_fields,26,1,'Gain D','Gain Dérivé','RW');
consts.mx28_fields = add_field(consts.mx28_fields,27,1,'Gain I','Gain Integral','RW');
consts.mx28_fields = add_field(consts.mx28_fields,28,1,'Gain P','Gain Proportionnel','RW');
consts.mx28_fields = add_field(consts.mx28_fields,30,2,'Consigne de position','Consigne de position','RW');
consts.mx28_fields = add_field(consts.mx28_fields,32,2,'Consigne de vitesse','Consigne de vitesse','RW');
consts.mx28_fields = add_field(consts.mx28_fields,34,2,'Limite de couple','Limite de couple','RW');
consts.mx28_fields = add_field(consts.mx28_fields,36,2,'Position courante','Retour de position','R');
consts.mx28_fields = add_field(consts.mx28_fields,38,2,'Vitesse courante','Retour de vitesse','R');
consts.mx28_fields = add_field(consts.mx28_fields,40,2,'Charge courante','Retour de charge','R');
consts.mx28_fields = add_field(consts.mx28_fields,42,1,'Tension','Tension d''alimentation','AR');
consts.mx28_fields = add_field(consts.mx28_fields,43,1,'Température','Température','AR');
consts.mx28_fields = add_field(consts.mx28_fields,44,1,'"Registered"','Instruction en cours "Registered"','AR');
consts.mx28_fields = add_field(consts.mx28_fields,46,1,'Déplacement','Déplacement en cours','AR');
consts.mx28_fields = add_field(consts.mx28_fields,47,1,'Verrouillage','Verrouillage de la mémoire EEPROM','ARW');
consts.mx28_fields = add_field(consts.mx28_fields,48,2,'Dépassement','Dépassement du couple maximal','ARW');

consts.cm730_fields = {};
consts.cm730_fields = add_field(consts.cm730_fields,0,2,'Modèle','Numéro de modèle','AR');
consts.cm730_fields = add_field(consts.cm730_fields,2,1,'Version','Information de version','AR');
consts.cm730_fields = add_field(consts.cm730_fields,3,1,'ID','ID du CM730 sur le bus Dynamixel','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,4,1,'Débit binaire','Débit binaire du bus Dynamixel','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,5,1,'Temps de retour','Temps de retour','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,16,1,'Retour de statut','Configuration du retour automatique de statut','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,24,1,'Activation du bus','Activation du bus Dynamixel','ARW');
consts.cm730_fields = add_field(consts.cm730_fields,25,1,'LED du panneau','Activation des LED du panneau','RW');
consts.cm730_fields = add_field(consts.cm730_fields,26,2,'LED de la tête','Activation des LED de la tête','RW');
consts.cm730_fields = add_field(consts.cm730_fields,28,2,'LED des yeux','Activation des LED des yeux','RW');
consts.cm730_fields = add_field(consts.cm730_fields,30,1,'Boutons','Etat des boutons','R');
consts.cm730_fields = add_field(consts.cm730_fields,38,2,'Gyro Z','Gyroscope axe Z','R');
consts.cm730_fields = add_field(consts.cm730_fields,40,2,'Gyro Y','Gyroscope axe Y','R');
consts.cm730_fields = add_field(consts.cm730_fields,42,2,'Gyro X','Gyroscope axe X','R');
consts.cm730_fields = add_field(consts.cm730_fields,44,2,'ACC X','Accéléromètre axe X','R');
consts.cm730_fields = add_field(consts.cm730_fields,46,2,'ACC Y','Accéléromètre axe Y','R');
consts.cm730_fields = add_field(consts.cm730_fields,48,2,'ACC Z','Accéléromètre axe Z','R');
consts.cm730_fields = add_field(consts.cm730_fields,50,1,'Tension','Tension d''alimentation','AR');
consts.cm730_fields = add_field(consts.cm730_fields,51,2,'Micro gauche','Microphone gauche','R');
consts.cm730_fields = add_field(consts.cm730_fields,53,2,'CAN 2','CAN canal 2','AR');
consts.cm730_fields = add_field(consts.cm730_fields,55,2,'CAN 3','ADC channel 3','AR');
consts.cm730_fields = add_field(consts.cm730_fields,57,2,'CAN 4','ADC channel 4','AR');
consts.cm730_fields = add_field(consts.cm730_fields,59,2,'CAN 5','ADC channel 5','AR');
consts.cm730_fields = add_field(consts.cm730_fields,61,2,'CAN 6','ADC channel 6','AR');
consts.cm730_fields = add_field(consts.cm730_fields,63,2,'CAN 7','ADC channel 7','AR');
consts.cm730_fields = add_field(consts.cm730_fields,65,2,'CAN 8','ADC channel 8','AR');
consts.cm730_fields = add_field(consts.cm730_fields,67,2,'Micro droit','Microphone droit','R');
consts.cm730_fields = add_field(consts.cm730_fields,69,2,'CAN 10','ADC channel 10','AR');
consts.cm730_fields = add_field(consts.cm730_fields,71,2,'CAN 11','ADC channel 11','AR');
consts.cm730_fields = add_field(consts.cm730_fields,73,2,'CAN 12','ADC channel 12','AR');
consts.cm730_fields = add_field(consts.cm730_fields,75,2,'CAN 13','ADC channel 13','AR');
consts.cm730_fields = add_field(consts.cm730_fields,77,2,'CAN 14','ADC channel 14','AR');
consts.cm730_fields = add_field(consts.cm730_fields,79,2,'CAN 15','ADC channel 15','AR');

consts.fsr_fields = {};
consts.fsr_fields = add_field(consts.fsr_fields,0,2,'Modèle','Numéro de modèle','AR');
consts.fsr_fields = add_field(consts.fsr_fields,2,1,'Version','Information de version','AR');
consts.fsr_fields = add_field(consts.fsr_fields,3,1,'ID','ID du FSR sur le bus Dynamixel','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,4,1,'Débit binaire','Débit binaire du bus Dynamixel','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,5,1,'Temps de retour','Temps de retour','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,16,1,'Retour de statut','Configuration du retour automatique de statut','ARW');
consts.fsr_fields = add_field(consts.fsr_fields,19,1,'Mode','Mode de fonctionnement','RW');
consts.fsr_fields = add_field(consts.fsr_fields,25,1,'LED','Allumage de la LED','RW');
consts.fsr_fields = add_field(consts.fsr_fields,26,2,'Jauge 1','Jauge de déformation 1','R');
consts.fsr_fields = add_field(consts.fsr_fields,28,2,'Jauge 2','Jauge de déformation 2','R');
consts.fsr_fields = add_field(consts.fsr_fields,30,2,'Jauge 3','Jauge de déformation 3','R');
consts.fsr_fields = add_field(consts.fsr_fields,32,2,'Jauge 4','Jauge de déformation 4','R');
consts.fsr_fields = add_field(consts.fsr_fields,34,1,'Jauge X','Jauge de déformation (axe X)','R');
consts.fsr_fields = add_field(consts.fsr_fields,35,1,'Jauge Y','Jauge de déformation (axe Y)','R');
consts.fsr_fields = add_field(consts.fsr_fields,42,1,'Tension','Tension d''alimentation','AR');
consts.fsr_fields = add_field(consts.fsr_fields,44,1,'"Registered"','Instruction en cours "Registered"','AR');
consts.fsr_fields = add_field(consts.fsr_fields,47,1,'Verrouillage','Verrouillage de la mémoire EEPROM','ARW');

consts.vision_fields = {};
consts.vision_fields = add_field(consts.vision_fields,1,1,'Activation','Activation de la vision','RW');
consts.vision_fields = add_field(consts.vision_fields,2,1,'Balle: activation','Activation de la reconnaissance de la balle','RW');
consts.vision_fields = add_field(consts.vision_fields,3,1,'Rouge: activation','Activation de la reconnaissance de la zone rouge','RW');
consts.vision_fields = add_field(consts.vision_fields,4,1,'Jaune: activation','Activation de la reconnaissance de la zone jaune','RW');
consts.vision_fields = add_field(consts.vision_fields,5,1,'Bleu: activation','Activation de la reconnaissance de la zone bleue','RW');
consts.vision_fields = add_field(consts.vision_fields,9,1,'Diffusion','Diffusion des images sur le serveur HTTP','RW');
consts.vision_fields = add_field(consts.vision_fields,10,2,'Largeur','Largeur de la caméra en pixels','R');
consts.vision_fields = add_field(consts.vision_fields,12,2,'Hauteur','Hauteur de la caméra en pixels','R');
consts.vision_fields = add_field(consts.vision_fields,20,2,'Balle: teinte cen.','Valeur centrale de la teinte de la balle','RW');
consts.vision_fields = add_field(consts.vision_fields,22,2,'Balle: teinte tol.','Tolérance sur la teinte de la balle','RW');
consts.vision_fields = add_field(consts.vision_fields,24,1,'Balle: sat. min.','Seuil minimal sur la saturation de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,25,1,'Balle: sat. max.','Seuil maximal sur la saturation de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,26,1,'Balle: val. min.','Seuil minimal sur la valeur de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,27,1,'Balle: val. max.','Seuil maximal sur la valeur de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,28,1,'Balle: couv. min.','Seuil minimal sur la couverture de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,29,1,'Balle: couv. max.','Seuil maximal sur la couverture de la balle','ARW');
consts.vision_fields = add_field(consts.vision_fields,30,2,'Balle: X','Position X de la balle','R');
consts.vision_fields = add_field(consts.vision_fields,32,2,'Balle: Y','Position Y de la balle','R');
consts.vision_fields = add_field(consts.vision_fields,40,2,'Rouge: teinte cen.','Valeur centrale de la teinte de la zone rouge','RW');
consts.vision_fields = add_field(consts.vision_fields,42,2,'Rouge: teinte tol.','Tolérance sur la teinte de la zone rouge','RW');
consts.vision_fields = add_field(consts.vision_fields,44,1,'Rouge: sat. min.','Seuil minimal sur la saturation de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,45,1,'Rouge: sat. max.','Seuil maximal sur la saturation de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,46,1,'Rouge: val. min.','Seuil minimal sur la valeur de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,47,1,'Rouge: val. max.','Seuil maximal sur la valeur de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,48,1,'Rouge: couv. min.','Seuil minimal sur la couverture de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,49,1,'Rouge: couv. max.','Seuil maximal sur la couverture de la zone rouge','ARW');
consts.vision_fields = add_field(consts.vision_fields,50,2,'Rouge: X','Position X de la zone rouge','R');
consts.vision_fields = add_field(consts.vision_fields,52,2,'Rouge: Y','Position Y de la zone rouge','R');
consts.vision_fields = add_field(consts.vision_fields,60,2,'Jaune: teinte cen.','Valeur centrale de la teinte de la zone jaune','RW');
consts.vision_fields = add_field(consts.vision_fields,62,2,'Jaune: teinte tol.','Tolérance sur la teinte de la zone jaune','RW');
consts.vision_fields = add_field(consts.vision_fields,64,1,'Jaune: sat. min.','Seuil minimal sur la saturation de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,65,1,'Jaune: sat. max.','Seuil maximal sur la saturation de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,66,1,'Jaune: val. min.','Seuil minimal sur la valeur de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,67,1,'Jaune: val. max.','Seuil maximal sur la valeur de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,68,1,'Jaune: couv. min.','Seuil minimal sur la couverture de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,69,1,'Jaune: couv. max.','Seuil maximal sur la couverture de la zone jaune','ARW');
consts.vision_fields = add_field(consts.vision_fields,70,2,'Jaune: X','Position X de la zone jaune','R');
consts.vision_fields = add_field(consts.vision_fields,72,2,'Jaune: Y','Position Y de la zone jaune','R');
consts.vision_fields = add_field(consts.vision_fields,80,2,'Bleu: teinte cen.','Valeur centrale de la teinte de la zone bleue','RW');
consts.vision_fields = add_field(consts.vision_fields,82,2,'Bleu: teinte tol.','Tolérance sur la teinte de la zone bleue','RW');
consts.vision_fields = add_field(consts.vision_fields,84,1,'Bleu: sat. min.','Seuil minimal sur la saturation de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,85,1,'Bleu: sat. max.','Seuil maximal sur la saturation de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,86,1,'Bleu: val. min.','Seuil minimal sur la valeur de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,87,1,'Bleu: val. max.','Seuil maximal sur la valeur de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,88,1,'Bleu: couv. min.','Seuil minimal sur la couverture de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,89,1,'Bleu: couv. max.','Seuil maximal sur la couverture de la zone bleue','ARW');
consts.vision_fields = add_field(consts.vision_fields,90,2,'Bleu: X','Position X de la zone bleue','R');
consts.vision_fields = add_field(consts.vision_fields,92,2,'Bleu: Y','Position Y de la zone bleue','R');

consts.ids = {};
consts.ids = add_id(consts.ids,'Épaule droite (tangage)',1,200,315);
consts.ids = add_id(consts.ids,'Épaule gauche (tangage)',2,270,315);
consts.ids = add_id(consts.ids,'Épaule droite (roulis)',3,140,295);
consts.ids = add_id(consts.ids,'Épaule gauche (roulis)',4,325,295);
consts.ids = add_id(consts.ids,'Coude droit',5,108,297);
consts.ids = add_id(consts.ids,'Coude gauche',6,360,297);
consts.ids = add_id(consts.ids,'Hanche droite (lacet)',7,200,250);
consts.ids = add_id(consts.ids,'Hanche gauche (lacet)',8,270,250);
consts.ids = add_id(consts.ids,'Hanche droite (roulis)',9,145,185);
consts.ids = add_id(consts.ids,'Hanche gauche (roulis)',10,325,185);
consts.ids = add_id(consts.ids,'Hanche droite (tangage)',11,200,185);
consts.ids = add_id(consts.ids,'Hanche gauche (tangage)',12,265,185);
consts.ids = add_id(consts.ids,'Genou droit',13,200,125);
consts.ids = add_id(consts.ids,'Genou gauche',14,265,125);
consts.ids = add_id(consts.ids,'Cheville droite (tangage)',15,200,60);
consts.ids = add_id(consts.ids,'Cheville gauche (tangage)',16,265,60);
consts.ids = add_id(consts.ids,'Cheville droite (roulis)',17,140,50);
consts.ids = add_id(consts.ids,'Cheville gauche (roulis)',18,330,50);
consts.ids = add_id(consts.ids,'Tête (lacet)',19,235,310);
consts.ids = add_id(consts.ids,'Tête (tangage)',20,235,355);
consts.ids = add_id(consts.ids,'Sous contrôleur',200,235,265);
consts.ids = add_id(consts.ids,'Pied droit',111,200,20);
consts.ids = add_id(consts.ids,'Pied gauche',112,265,20);
consts.ids = add_id(consts.ids,'Vision',-1,225,380);

consts.labels = {
    'Configuration de la communication avec le Darwin-OP (%s)', ...
    'Données à lire (ctrl+click pour multiples):', ...
    'Données à écrire (ctrl+click pour multiples):', ...
    'Sélection', ...
    'Lecture/écriture', ...
    'Écriture', ...
    'Lecture', ...
    'Pas d''opération', ...
    'Adresse IP :', ...
    'Port :', ...
    'Protocole :', ...
    'Période d''éch.(s):', ...
    'Configuration avancée', ...
    'Valider et fermer', ...
  };

consts.language = 'français';

end

function fields = add_field(f, address, size, name, description, mode)
fields = f;
fields{end+1} = struct('address', address, ...
                       'size', size, ...
                       'name', name, ...
                       'description', description, ...
                       'mode', mode);
if size == 2
    fields{end+1} = struct('address', address, ...
                           'size', 1, ...
                           'name', sprintf('%s (f)', name), ...
                           'description', sprintf('%s (poids faible)', description), ...
                           'mode', ['A' mode]);
    fields{end+1} = struct('address', address + 1, ...
                           'size', 1, ...
                           'name', sprintf('%s (F)', name), ...
                           'description', sprintf('%s (poids fort)', description), ...
                           'mode', ['A' mode]);
end

end

function ids = add_id(i, name, address, posx, posy)
ids = i;
ids{end+1} = struct('address', address, ...
                    'name', name, ...
                    'posx', posx, ...
                    'posy', posy);
end
