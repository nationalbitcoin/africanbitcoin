VERSION=$(git tag | tail -1 | cut -d'v' -f 2)
ARCH=amd64
src=$(git rev-parse --show-toplevel)

# Create temporary directories
cp -r clionly_template "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}"
cp -r qtonly_template "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}"
cp -r full_template "$PWD/africanbitcoin_full-${VERSION}_${ARCH}"
cp -r blob_template "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu"

# Replace version and architecture
sed -i "s/VERSION/${VERSION}/" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

sed -i "s/ARCH/${ARCH}/" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

# Copy package contents

## mans

### clionly
cp "$src/doc/man/africanbitcoind.1" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/africanbitcoind.1"
cp "$src/doc/man/africanbitcoin-tx.1" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-tx.1"
cp "$src/doc/man/africanbitcoin-cli.1" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-cli.1"
cp "$src/doc/man/africanbitcoin-wallet.1" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-wallet.1"

### full
cp "$src/doc/man/africanbitcoind.1" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/share/man/man1/africanbitcoind.1"
cp "$src/doc/man/africanbitcoin-tx.1" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-tx.1"
cp "$src/doc/man/africanbitcoin-cli.1" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-cli.1"
cp "$src/doc/man/africanbitcoin-wallet.1" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-wallet.1"
cp "$src/doc/man/africanbitcoin-qt.1" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-qt.1"

### blob
cp "$src/doc/man/africanbitcoind.1" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/africanbitcoind.1"
cp "$src/doc/man/africanbitcoin-tx.1" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/africanbitcoin-tx.1"
cp "$src/doc/man/africanbitcoin-cli.1" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/africanbitcoin-cli.1"
cp "$src/doc/man/africanbitcoin-wallet.1" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/africanbitcoin-wallet.1"
cp "$src/doc/man/africanbitcoin-qt.1" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/africanbitcoin-qt.1"

### qtonly

cp "$src/doc/man/africanbitcoin-qt.1" "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}/share/man/man1/africanbitcoin-qt.1"

## binaries

### clionly
cp "$src/src/africanbitcoind" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/bin/africanbitcoind"
cp "$src/src/africanbitcoin-tx" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/bin/africanbitcoin-tx"
cp "$src/src/africanbitcoin-cli" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/bin/africanbitcoin-cli"
cp "$src/src/africanbitcoin-wallet" "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}/bin/africanbitcoin-wallet"

### full
cp "$src/src/africanbitcoind" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/bin/africanbitcoind"
cp "$src/src/africanbitcoin-tx" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/bin/africanbitcoin-tx"
cp "$src/src/africanbitcoin-cli" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/bin/africanbitcoin-cli"
cp "$src/src/africanbitcoin-wallet" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/bin/africanbitcoin-wallet"
cp "$src/src/qt/africanbitcoin-qt" "$PWD/africanbitcoin_full-${VERSION}_${ARCH}/bin/africanbitcoin-qt"

### blob
cp "$src/src/africanbitcoind" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/africanbitcoind"
cp "$src/src/africanbitcoin-tx" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/africanbitcoin-tx"
cp "$src/src/africanbitcoin-cli" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/africanbitcoin-cli"
cp "$src/src/africanbitcoin-wallet" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/africanbitcoin-wallet"
cp "$src/src/qt/africanbitcoin-qt" "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/africanbitcoin-qt"


### qtonly
cp "$src/src/qt/africanbitcoin-qt" "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}/bin/africanbitcoin-qt"

# Build packages
dpkg -b "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}"
dpkg -b "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}"
dpkg -b "$PWD/africanbitcoin_full-${VERSION}_${ARCH}"
tar -czf "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz" -C "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu" .

# Remove temporary directories
rm -rf "$PWD/africanbitcoin_clionly-${VERSION}_${ARCH}"
rm -rf "$PWD/africanbitcoin_qtonly-${VERSION}_${ARCH}"
rm -rf "$PWD/africanbitcoin_full-${VERSION}_${ARCH}"
rm -rf "$PWD/africanbitcoin-${VERSION}-${ARCH}-linux-gnu"
