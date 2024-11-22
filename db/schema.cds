// Información sacada de https://opendata.sabadell.cat/ca/
// metadatos de las entidades en http://odata.sabadell.cat/odata4Productor/odata4Productor.svc/$metadata
namespace mnj.sbd;

using {cuid, managed } from '@sap/cds/common';

type String255 : String(255) null;
type Entero32  : Int32 not null;

type Voluntari {
    Derivats    : Entero32;
    Treballador : String255;
    DataAlta    : String255;
    Ordre       : Entero32;
    IdPersona   : Entero32;
    Aturat      : String255;
    Municipi    : String255;
    Estudiant   : String255;
    Voluntaris  : Entero32;
    Jubilat     : String255;
    Sexe        : String255;
    FranjaEdat  : Int32 enum {
        joven   = 1;
        adulto  = 2;
        mediana = 3;
        mayor   = 4;
    };
};

entity Pmh3OdLlarsnacionalitat {
        NomesNacionals  : Int32 null;
        Districte       : Int32 null;
    key Ordre           : Int32 not null;
        NomesEstrangers : Int32 null;
        Sector          : String null;
        Mixtes          : Int32 null;
        DataOficial     : String null;
};

entity Pmh3OdLlarsnombrepersones {
        NombreLlars     : Int32 null;
        Districte       : Pmh3OdLlarsnacionalitat:Districte;
    key Ordre           : Pmh3OdLlarsnacionalitat:Ordre;
        Sector          : Pmh3OdLlarsnacionalitat:Sector;
        DataOficial     : Pmh3OdLlarsnacionalitat:DataOficial;
        NombreHabitants : Int32 null;
};

entity Pmh3OdDadesdemografiques {
        Districte        : Pmh3OdLlarsnacionalitat:Districte;
    key Ordre            : Pmh3OdLlarsnacionalitat:Ordre;
        TotalHomes       : Int32 null;
        Sector           : Pmh3OdLlarsnacionalitat:Sector;
        TotalNacionals   : Int32 null;
        DataOficial      : Pmh3OdLlarsnacionalitat:DataOficial;
        TotalEstrangers  : Int32 null;
        TotalComunitaris : Int32 null;
        TotalDones       : Int32 null;
};

entity Voluntariat : cuid {
    Voluntari : Voluntari;
};

entity Dummy : cuid , managed{
    field : String(1);
    Executed : Timestamp default $now;
    // Executedby : String(255) default $user.id;
};
