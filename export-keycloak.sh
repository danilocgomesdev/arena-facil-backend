#!/bin/bash

# Caminho dos arquivos de exportação
EXPORT_DIR="/opt/keycloak/data/export"
EXPORT_BACKUP_DIR="/opt/keycloak/data/last-export"

# Realm que será monitorado
REALM_NAME="arena-facil"

# Função para exportar configurações
export_keycloak_config() {
    echo "Exportando configurações do Keycloak..."
    /opt/keycloak/bin/kc.sh export --dir $EXPORT_DIR --realm=$REALM_NAME
    echo "Configurações exportadas com sucesso."
}

# Função para verificar alterações
check_for_changes() {
    echo "Verificando alterações no Keycloak..."
    if [ ! -d "$EXPORT_BACKUP_DIR" ]; then
        echo "Nenhum backup encontrado. Criando backup inicial..."
        mkdir -p "$EXPORT_BACKUP_DIR"
        cp -r "$EXPORT_DIR/"* "$EXPORT_BACKUP_DIR/"
        return 0
    fi

    # Comparar os arquivos exportados com os backups
    DIFF_OUTPUT=$(diff -qr "$EXPORT_DIR" "$EXPORT_BACKUP_DIR")

    if [ -z "$DIFF_OUTPUT" ]; then
        echo "Nenhuma alteração detectada. Exportação não necessária."
        return 1
    else
        echo "Alterações detectadas. Realizando exportação."
        return 0
    fi
}

# Exportar configurações apenas se houver alterações
check_for_changes && export_keycloak_config

# Atualizar o backup
echo "Atualizando backup das configurações exportadas..."
rm -rf "$EXPORT_BACKUP_DIR"
mkdir -p "$EXPORT_BACKUP_DIR"
cp -r "$EXPORT_DIR/"* "$EXPORT_BACKUP_DIR/"
echo "Backup atualizado com sucesso."
