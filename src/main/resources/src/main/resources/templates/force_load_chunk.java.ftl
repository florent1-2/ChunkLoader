if (!world.isClientSide()) {
    try {
        net.minecraft.server.level.ServerLevel serverWorld = (net.minecraft.server.level.ServerLevel) world;
        net.minecraft.world.level.chunk.ChunkPos chunkPos = new net.minecraft.world.level.chunk.ChunkPos((int)x >> 4, (int)z >> 4);
        int level = 2;
        if (enable) {
            serverWorld.getChunkSource().addRegionTicket(net.minecraft.server.world.ChunkTicketType.FORCED, chunkPos, level, chunkPos);
        } else {
            try {
                java.lang.reflect.Method remove = serverWorld.getChunkSource().getClass()
                        .getMethod("removeRegionTicket", net.minecraft.server.world.ChunkTicketType.class, net.minecraft.world.level.chunk.ChunkPos.class, int.class, java.lang.Object.class);
                remove.invoke(serverWorld.getChunkSource(), net.minecraft.server.world.ChunkTicketType.FORCED, chunkPos, level, chunkPos);
            } catch (Throwable t) { t.printStackTrace(); }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
}
