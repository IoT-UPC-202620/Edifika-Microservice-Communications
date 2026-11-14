-- Datos de prueba locales (solo corre con SEED_MODE=always). Idempotente.
-- building_id = edificios de Residential (1..2); user_id = usuarios de IAM.

INSERT INTO announcements (id, created_at, updated_at, building_id, created_by_user_id, description, message, priority, status, title) VALUES
  (1, now() - interval '5 days', now() - interval '5 days', 1, 1, 'Corte programado de agua',
      'El jueves de 9:00 a 13:00 se realizara el mantenimiento de la cisterna. Almacene agua con anticipacion.', 'HIGH', 'PUBLISHED', 'Corte de agua por mantenimiento'),
  (2, now() - interval '3 days', now() - interval '3 days', 1, 1, 'Asamblea ordinaria de propietarios',
      'Se convoca a la asamblea ordinaria el sabado a las 18:00 en el salon de fiestas.', 'NORMAL', 'PUBLISHED', 'Asamblea de propietarios'),
  (3, now() - interval '1 day', now() - interval '1 day', 2, 1, 'Nuevo control de acceso con tarjeta',
      'Desde el lunes el ingreso al lobby sera unicamente con tarjeta RFID. Recoja la suya en administracion.', 'URGENT', 'PUBLISHED', 'Acceso con tarjeta RFID'),
  (4, now() - interval '20 days', now() - interval '20 days', 1, 1, 'Fumigacion de areas comunes',
      'La fumigacion trimestral se realizo con exito.', 'LOW', 'ARCHIVED', 'Fumigacion trimestral')
ON CONFLICT DO NOTHING;

INSERT INTO announcement_reads (id, created_at, updated_at, announcement_id, read_at, user_id) VALUES
  (1, now(), now(), 1, now() - interval '4 days', 2),
  (2, now(), now(), 1, now() - interval '4 days', 3),
  (3, now(), now(), 2, now() - interval '2 days', 2),
  (4, now(), now(), 3, now() - interval '12 hours', 5)
ON CONFLICT DO NOTHING;

SELECT setval(pg_get_serial_sequence('announcements', 'id'), (SELECT MAX(id) FROM announcements));
SELECT setval(pg_get_serial_sequence('announcement_reads', 'id'), (SELECT MAX(id) FROM announcement_reads));
