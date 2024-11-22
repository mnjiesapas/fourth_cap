using mnj.sbd as sbd from '../db/schema';

service fourth_cap {
    entity Pmh3OdLlarsnacionalitat as projection on sbd.Pmh3OdLlarsnacionalitat;
    entity LlarsnacionalitatFilt   as projection on sbd.Pmh3OdLlarsnacionalitat;
    entity Pmh3OdLlarsnombrepersones as projection on sbd.Pmh3OdLlarsnombrepersones;
    entity Pmh3OdDadesdemografiques as projection on sbd.Pmh3OdDadesdemografiques;
    entity Voluntariat as projection on sbd.Voluntariat;
    entity Dummy as projection on sbd.Dummy;
};